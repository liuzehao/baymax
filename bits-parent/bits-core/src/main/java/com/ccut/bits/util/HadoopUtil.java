package com.ccut.bits.util;

import com.ccut.bits.constant.Constant;
import com.ccut.bits.expert.dao.ExpertDao;
import com.ccut.bits.expert.service.ExpertService;
import com.ccut.bits.themeWeb.model.PeopleRank;
import com.ccut.bits.themeWeb.model.ThemeWeb;
import com.ccut.bits.themeWeb.service.ThemeWebService;
import com.csvreader.CsvReader;
import com.csvreader.CsvWriter;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.*;
import java.net.URI;
import java.nio.charset.Charset;
import java.util.*;

/**
 * Created by Dintama on 2015/8/13.
 */
public class HadoopUtil {

    @Autowired
    private ExpertDao expertDao;

    @Autowired
    private ThemeWebService themeWebService;

    private StringUtil stringUtil = new StringUtil();

    public void getExpertTheme(Integer id) throws Exception {
        List<String> names;
        int count = 1;
        String name;
        //主要：用来记录用户和RankId间的关系
        HashMap<String, Integer> match = new HashMap<>();
        LinkedList<Integer> ids = new LinkedList<>();
        //主要：通过用户的RankId来记录两两之间的关联
        LinkedList<Integer> firsts = new LinkedList<>();
        LinkedList<Integer> seconds = new LinkedList<>();
        HashMap<Integer, Integer> reRank = new HashMap<>();
        List<String> result =  expertDao.getExpertRelationshipByThemeId(id);
        System.out.println("开始输出:");
        for(String str : result){   //一行有关联的get！
            String[] temp = str.split(";| ");
            names = Arrays.asList(temp);
            ids.clear();
            //分割完毕，开始弄关联图啦~
            for(String tmp : names ){
                name = stringUtil.clearNotChinese(tmp);
                //判断是否已经在这个Map中
                if(!name.isEmpty() && !match.containsKey(name)){  //如果已经存在
                    match.put(name, count);
                    ids.add(count++);
                }else if(!name.isEmpty()){
                    ids.add(match.get(name));
                }
            }
            for(Integer first : ids){
                reRank.put(first, 1);
                for(Integer second : ids) {
                    /*System.out.println(first + "        " + second);*/
                    if (first != second) {
                        firsts.add(first);
                        seconds.add(second);
                    }
                }
            }
        }

        createCsvFile("match", id.toString(), match);
        createCsvFile("pr", id.toString(), reRank);
        createPeopleCsvFile(id.toString(), firsts, seconds);
    }



    public void createCsvFile(String fileName, String themeId, HashMap map) throws Exception {
        String csvFilePath = "d:/hadoopTest/" + themeId + "/input";
        File file = new File(csvFilePath);
        if  (!file .exists()  && !file .isDirectory())
        {
            System.out.println("//不存在");
            file .mkdirs();
        } else
        {
            System.out.println("//目录存在");
        }
        csvFilePath += "/" + fileName + ".csv";
        file = new File(csvFilePath);
        if(!file.exists()){
            file.createNewFile();
        }
        CsvWriter wr =new CsvWriter(csvFilePath,',', Charset.forName("UTF-8"));
        Iterator iterator = map.entrySet().iterator();
        while(iterator.hasNext()){
            Map.Entry entry = (Map.Entry) iterator.next();
            wr.writeRecord(new String[]{entry.getKey().toString(), entry.getValue().toString()});
        }
        wr.close();
    }

    public void createPeopleCsvFile(String themeId, LinkedList firsts, LinkedList seconds) throws Exception{
        String csvFilePath = "d:/hadoopTest/" + themeId + "/input";
        File file = new File(csvFilePath);
        if  (!file .exists()  && !file .isDirectory())
        {
            System.out.println("//不存在");
            file .mkdirs();
        } else
        {
            System.out.println("//目录存在");
        }
        csvFilePath += "/people.csv";
        file = new File(csvFilePath);
        if(!file.exists()){
            file.createNewFile();
        }
        CsvWriter wr =new CsvWriter(csvFilePath,',', Charset.forName("UTF-8"));
        Iterator iterator = firsts.iterator();
        Iterator iterator1 = seconds.iterator();
        while(iterator.hasNext() && iterator1.hasNext()){
            Integer first = (Integer)iterator.next();
            Integer second = (Integer)iterator1.next();
            wr.writeRecord(new String[]{first.toString(), second.toString()});
        }
        wr.close();
    }

    public void updateHdfs(Integer id) throws  Exception {
        LinkedList<String> names = new LinkedList<>();
        names.add("match");
        names.add("pr");
        names.add("people");
        FileSystem fileSystem = FileSystem.get(new URI("hdfs://hadoop01:9000"), new Configuration());
        for(String name : names) {
            InputStream inputStream = new FileInputStream("d:/hadoopTest/" + id + "/input/" + name + ".csv");
            OutputStream outputStream = fileSystem.create(new Path("/data/peopleRank/" + id + "/input/" + name + ".csv"));
            IOUtils.copyBytes(inputStream, outputStream, 4096, true);
        }
    }

    public void downloadHdfs(Integer id) throws Exception{
        FileSystem fileSystem = FileSystem.get(new URI("hdfs://hadoop01:9000"), new Configuration());
        InputStream inputStream = fileSystem.open(new Path("d:/hadoopTest/" + id + "/output/result.csv"));
        OutputStream outputStream = new FileOutputStream("/data/peopleRank/" + id + "/output/result.csv");
        IOUtils.copyBytes(inputStream, outputStream, 4096, true);
    }

    public void readerCsvFile(Integer id) throws Exception{
        HashMap<Integer, String> peoples = new HashMap<>();
        HashMap<Integer, Double> peopleRanks = new HashMap<>();
        LinkedList<Integer> firsts = new LinkedList<>();
        LinkedList<Integer> seconds = new LinkedList<>();
        //1.match
        ArrayList<String[]> csvList = new ArrayList<String[]>(); //用来保存数据
        String csvFilePath = "d:/hadoopTest/" + id + "/input/match.csv";
        CsvReader reader = new CsvReader(csvFilePath,',', Charset.forName("UTF-8"));    //一般用这编码读就可以了

        reader.readHeaders(); // 跳过表头   如果需要表头的话，不要写这句。

        while(reader.readRecord()){ //逐行读入除表头的数据
            csvList.add(reader.getValues());
        }
        reader.close();

        for(int row=0;row<csvList.size();row++){

            peoples.put(Integer.parseInt(csvList.get(row)[1]), csvList.get(row)[0]) ; //取得第row行第所有列的数据
        }

        //2.result

        csvList = new ArrayList<String[]>(); //用来保存数据
        csvFilePath = "d:/hadoopTest/" + id + "/output/result.csv";
        reader = new CsvReader(csvFilePath,',', Charset.forName("UTF-8"));    //一般用这编码读就可以了

        reader.readHeaders(); // 跳过表头   如果需要表头的话，不要写这句。

        while(reader.readRecord()){ //逐行读入除表头的数据
            csvList.add(reader.getValues());
        }
        reader.close();

        for(int row=0;row<csvList.size();row++){

            peopleRanks.put(Integer.parseInt(csvList.get(row)[0]), Double.parseDouble(csvList.get(row)[1])) ; //取得第row行第所有列的数据
        }

        //3.relationship
        csvList = new ArrayList<String[]>(); //用来保存数据
        csvFilePath = "d:/hadoopTest/" + id + "/input/people.csv";
        reader = new CsvReader(csvFilePath,',', Charset.forName("UTF-8"));    //一般用这编码读就可以了

        reader.readHeaders(); // 跳过表头   如果需要表头的话，不要写这句。

        while(reader.readRecord()){ //逐行读入除表头的数据
            csvList.add(reader.getValues());
        }
        reader.close();

        for(int row=0;row<csvList.size();row++){
            firsts.add(Integer.parseInt(csvList.get(row)[0]));
            seconds.add(Integer.parseInt(csvList.get(row)[0]));
        }

        PeopleRank peopleRank = new PeopleRank();
        Iterator iterator = peoples.entrySet().iterator();
        while(iterator.hasNext()){
            Map.Entry entry = (Map.Entry)iterator.next();
            Integer rankId = (Integer)entry.getKey();
            String peopleName = (String)entry.getValue();
            Double rank = peopleRanks.get(rankId);
            peopleRank.setThemeId(id);
            peopleRank.setPeopleName(peopleName);
            peopleRank.setRank(rank);
            peopleRank.setRankId(rankId);
            themeWebService.addPeopleRank(peopleRank);
        }

        ThemeWeb themeWeb = new ThemeWeb();
        Iterator iterator1 = firsts.iterator();
        Iterator iterator2 = seconds.iterator();
        while(iterator1.hasNext() && iterator2.hasNext()) {
            themeWeb.setThemeId(id);
            themeWeb.setIdFirst((Integer) iterator1.next());
            themeWeb.setIdSecond((Integer) iterator2.next());
            themeWebService.addThemeWeb(themeWeb);
        }
    }
}
