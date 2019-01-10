package com.ccut.bits.expert.dao;

import com.ccut.bits.autocomplete.dao.AutoCompleteDao;
import com.ccut.bits.constant.Constant;
import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.lucene.LuceneIndex;
import com.ccut.bits.model.AutoComplete;
import com.ccut.bits.theme.service.ThemeService;
import com.ccut.bits.themeWeb.dao.ThemeWebDao;
import com.ccut.bits.themeWeb.model.PeopleRank;
import com.ccut.bits.themeWeb.model.ThemeWeb;
import com.ccut.bits.themeWeb.service.ThemeWebService;
import com.ccut.bits.util.SpringTransactionalTestCase;
import com.csvreader.CsvReader;
import com.csvreader.CsvWriter;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.apache.lucene.document.*;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import java.io.*;
import java.lang.reflect.Array;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.util.*;

@ContextConfiguration("/applicationContext-test.xml")
public class ExpertDaoTest extends SpringTransactionalTestCase {

    @Autowired
    private AutoCompleteDao autoCompleteDao;

    @Autowired
    private ThemeService themeService;

    @Autowired
    private ThemeWebService themeWebService;

    @Autowired
    private ExpertDao expertDao;
//    @Autowired
//    private LuceneIndex luceneIndex;

    @Test
    public void testGetAllExpert() throws Exception {
        Set<Integer> a = new HashSet<>();
        a.add(1);
        a.add(2);
        System.out.println(a.toString());
        System.out.println(a.toString().substring(1,a.toString().length()-1));
//        List<Expert> result = expertDao.getAllExpert(null,null);
//        List<Document> docs = new LinkedList<Document>();
//        Document document;
//        for(Expert expert:result){
//            document = new Document();
//            document.add(new IntField(Constant.Index.Expert.FIELD_ID,expert.getId(), Field.Store.YES));
//            document.add(new TextField(Constant.Index.Expert.FIELD_NAME,expert.getExpertName(), Field.Store.YES));
//            document.add(new TextField(Constant.Index.Expert.FIELD_ORGANIZATION,expert.getExpertOrg(), Field.Store.YES));
////            document.add(new TextField(Constant.Index.Expert.FIELD_THEME,expert.getThemes(),Field.Store.YES));
//            document.add(new StringField(Constant.Index.CLASS,Constant.Index.EXPERT,Field.Store.YES));
//            docs.add(document);
//        }
//        luceneIndex.createIndex(docs);
    }
//@Test
//    public void testGetExpertById() throws Exception {
//        List<Integer> integers = new LinkedList<>();
//        integers.add(333);
//        integers.add(444);
//        expertDao.getExpertsByIds(integers);
//
//    }
//


    @Test
    public void testChinese(){
        String str = "中国好[2]";
        System.out.println(clearNotChinese(str));
    }

    @Test
    public void testGetExpertTheme() throws Exception {

        List<Integer> ids = themeService.getAllThemeId();
        for(Integer id : ids){
            getExpertTheme(id);
            updateHdfs(id);
        }
    }



    @Test
    public void testCsvFileIO(){
        try {

            String csvFilePath = "d:\\hadoopTest\\11\\";
            File file = new File(csvFilePath);
            if  (!file .exists()  && !file .isDirectory())
            {
                file .mkdirs();
            } else
            {
                System.out.println("//目录存在");
            }
            csvFilePath += "test.csv";
            CsvWriter wr =new CsvWriter(csvFilePath,',', Charset.forName("SJIS"));
            HashMap<Integer, Integer> contents = new HashMap<>();
            contents.put(1, 1);
            contents.put(2, 2);
            Iterator iter = contents.entrySet().iterator();
            while(iter.hasNext()){
                Map.Entry entry = (Map.Entry) iter.next();

                wr.writeRecord(new String[]{entry.getKey().toString(), entry.getValue().toString()});
            }

            wr.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void createDir(){
        String path = "d:\\test\\test";
        File file = new File(path);
        file.mkdirs();
    }

    @Test
    public void doubleTest(){
        LinkedList<Integer> list = new LinkedList<>();
        for(int i = 0; i < 10; i++){
            list.add(i);
        }

        getRelationship(list);

    }

    @Test
    public void testUpdate() throws Exception {
        updateHdfs(7);
    }

    @Test
    public void testReader() throws Exception {
        readerCsvFile(11);
    }

    private void getExpertTheme(Integer id) throws Exception {
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
                name = clearNotChinese(tmp);
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

    private HashMap getRelationship(LinkedList<Integer> list){
        HashMap<Integer, Integer> map = new HashMap<>();
        for(Integer first : list){
            for(Integer second : list){
                if(first != second)
                    /*System.out.println(first + "        " + second);*/
                    map.put(first, second);
            }
        }
        return map;
    }

    private String clearNotChinese(String buff){

        String tmpString =buff.replaceAll("(?i)[^a-zA-Z0-9\u4E00-\u9FA5]", "");//去掉所有中英文符号

        char[] carr = tmpString.toCharArray();

        for(int i = 0; i<tmpString.length();i++){

            if(carr[i] < 0xFF){

                carr[i] = ' ' ;//过滤掉非汉字内容

            }

        }

        return String.copyValueOf(carr).trim();

    }

    private void createCsvFile(String fileName, String themeId, HashMap map) throws Exception {
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

    private void createPeopleCsvFile(String themeId, LinkedList firsts, LinkedList seconds) throws Exception{
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

    private void updateHdfs(Integer id) throws  Exception {
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

    private void downloadHdfs(Integer id) throws Exception{
        FileSystem fileSystem = FileSystem.get(new URI("hdfs://hadoop01:9000"), new Configuration());
        InputStream inputStream = fileSystem.open(new Path("d:/hadoopTest/" + id + "/output/result.csv"));
        OutputStream outputStream = new FileOutputStream("/data/peopleRank/" + id + "/output/result.csv");
        IOUtils.copyBytes(inputStream, outputStream, 4096, true);
    }

    private void readerCsvFile(Integer id) throws Exception{
        ArrayList<String[]> csvList = new ArrayList<String[]>(); //用来保存数据
        String csvFilePath = "d:/hadoopTest/11/input/match.csv";
        CsvReader reader = new CsvReader(csvFilePath,',',Charset.forName("UTF-8"));    //一般用这编码读就可以了

        reader.readHeaders(); // 跳过表头   如果需要表头的话，不要写这句。

        while(reader.readRecord()){ //逐行读入除表头的数据
            csvList.add(reader.getValues());
        }
        reader.close();

        for(int row=0;row<csvList.size();row++){

            String  cell = csvList.get(row)[1]; //取得第row行第所有列的数据
            System.out.println(cell);
        }

    }

    @Test
    public void testCreatePeopleRank() throws Exception{
        createPeopleRank();
    }

    public  void createPeopleRank() throws Exception {
        List<PeopleRank> peopleRanks = themeWebService.getPeopleRank(11);
        Random random = new Random(85);
        List<Integer> ids = themeService.getAllThemeId();
        HashMap<Integer, String> peoples = new HashMap<>();
        for(Integer id : ids){

            //先把map弄来
            ArrayList<String[]> csvList = new ArrayList<String[]>(); //用来保存数据
            String csvFilePath = "d:/hadoopTest/" + id + "/input/match.csv";
            CsvReader reader = new CsvReader(csvFilePath,',',Charset.forName("UTF-8"));    //一般用这编码读就可以了

            reader.readHeaders(); // 跳过表头   如果需要表头的话，不要写这句。

            while(reader.readRecord()){ //逐行读入除表头的数据
                csvList.add(reader.getValues());
            }
            reader.close();

            for(int row=0;row<csvList.size();row++){

                peoples.put(Integer.parseInt(csvList.get(row)[1]), csvList.get(row)[0]) ; //取得第row行第所有列的数据
            }

            PeopleRank peopleRank = new PeopleRank();
            peopleRank.setThemeId(id);
            csvFilePath = "d:/hadoopTest/" + id + "/output";
            File file = new File(csvFilePath);
            if  (!file .exists()  && !file .isDirectory())
            {
                System.out.println("//不存在");
                file .mkdirs();
            } else
            {
                System.out.println("//目录存在");
            }
            csvFilePath += "/result.csv";
            file = new File(csvFilePath);
            if(!file.exists()){
                file.createNewFile();
            }
            CsvWriter wr =new CsvWriter(csvFilePath,',', Charset.forName("UTF-8"));

            Iterator iterator = peoples.entrySet().iterator();
            while(iterator.hasNext()){
                Integer temp = random.nextInt(85);
                double rank = peopleRanks.get(temp).getRank();
                peopleRank.setRank(rank);
                Map.Entry entry = (Map.Entry) iterator.next();
                peopleRank.setRankId((Integer)entry.getKey());
                peopleRank.setPeopleName(entry.getValue().toString());
                wr.writeRecord(new String[]{new Integer(peopleRank.getRankId()).toString(), new Double(peopleRank.getRank()).toString()});
            }
            wr.close();

            themeWebService.addPeopleRank(peopleRank);
        }


    }

    @Autowired
    private ThemeWebDao themeWebDao;


    @Test
    public void testFree(){
        List<ThemeWeb> themeWebs = themeWebService.getThemeWeb(11);
        for(ThemeWeb themeWeb : themeWebs){
            System.out.println(themeWeb.getIdFirst() + " " + themeWeb.getIdSecond());
        }
    }


}