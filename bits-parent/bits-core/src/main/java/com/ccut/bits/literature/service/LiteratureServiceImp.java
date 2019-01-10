package com.ccut.bits.literature.service;

import com.ccut.bits.literature.dao.LiteratureDao;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.page.Page;
import com.ccut.bits.relation.ThemeRelation;
import com.ccut.bits.theme.service.ThemeService;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.EuclideanDistanceSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.model.JDBCDataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.*;

/**
 * Created by Demon on 2015/4/11.
 */
@Service("literatureService")
public class LiteratureServiceImp implements LiteratureService {
    @Autowired
    private LiteratureDao literatureDao;
    @Autowired
    private ThemeRelation themeRelation;
    @Autowired
    private ThemeService themeService;
    private Map<Integer,Map<String,Set<Integer>>> relationMap;
    @Override
     public List<Literature> getLiteratureListPage(Literature literature) {
        return literatureDao.getLiteratureListPage(literature);
    }
    @Override
    public List<Literature> getAllLiterature(Page page) {
        int size = page.getPageSize();
        int begin = (page.getPageNo() - 1) * page.getPageSize();
        return literatureDao.getAllLiterature(begin, size);
    }
    @Override
    public List<Literature> getAllFile(Page page) {
        int size = page.getPageSize();
        int begin = (page.getPageNo() - 1) * page.getPageSize();
        return literatureDao.getAllFile(begin, size);
    }

    @Override
    public int getTotalRecord() {
        return literatureDao.getTotalRecord();
    }

    public  List<Literature>getRelationByFileId(int id){
        return literatureDao.getRelationByFileId(id);
    }

    @Override
    public int getTotalRecordByThemeId(int themeId) {
        return themeRelation.totalLiterature(themeId);
    }

    @Override
    public List<Literature> getLiteratureByThemeId(int themeId,Page page) {
        int begin = (page.getPageNo() - 1) * page.getPageSize();
        return literatureDao.getLiteratureByThemeId(themeId, begin, page.getPageSize());
    }
    @Override
  public  List<Literature> getLiteratureByThemeIdLimtNum(int themeId,int begin,int size){
        return literatureDao.getLiteratureByThemeId(themeId, begin, size);
    }
    @Override
    public List<Literature> getLiteraturesByIds(List<Integer> ids) {
        if (ids.isEmpty()) return new LinkedList<>();
        return literatureDao.getLiteraturesByIds(ids);
    }
    @Override
    public List<Literature> getAllLiteratureByThemeId(int themeId){
        return literatureDao.getAllLiteratureByThemeId(themeId);
    }
    @Override
    public String getTypeGeneralbyTypeName(String type){
        return literatureDao.getTypeGeneralbyTypeName(type);
    }

    @Override
    public void delLiterature(int id) {
        literatureDao.delLiterature(id);
    }

    @Override
    public void addLiterature(Literature literature) {
        literatureDao.addLiterature(literature);
    }
    @Override
    public void setGeneralFile(int fileId,int userId,String time){
        literatureDao.setGeneralFile(fileId, userId, time);
    }
    @Override
    public void setScore(int fileId,int userId,int score){
        literatureDao.setScore(fileId, userId, score);
    }
    @Override
    public void setTotleScore(int fileId,int score){
        literatureDao.setTotleScore(fileId, score);
        literatureDao.addScorePeople(fileId);
    }
    @Override
    public void editLiterature(Literature literature,String[] themeNames) {
       int fileUniqueId=literature.getFileUniqueId();

        Collection<Integer> themeIds =themeRelation.getThemeIds(themeNames);
        for (Integer themeId:themeIds){
            literatureDao.addLiteratureTheme(fileUniqueId,themeId.intValue());
        }
         //文件表操作
         literatureDao.editLiterature(literature);


    }
    @Override
    public int fileUniqueId(String themeName,String type,String fileId){
        int themeId=themeService.getThemeIdByThemeName(themeName);
        int typeId=literatureDao.getTypeIdbyTypeName(type);
        DecimalFormat nf = new DecimalFormat("000");
        String sb= nf.format(themeId);
        if(fileId.length()>4){
           fileId =fileId.substring(fileId.length()-4,fileId.length());
        }else{
            DecimalFormat nt = new DecimalFormat("0000");
            fileId= nt.format(Integer.parseInt(fileId));
        }
        String fileUniqueId=String.valueOf(typeId)+sb+fileId;
        return Integer.parseInt(fileUniqueId);
    }
    @Override
    public void updateUniqueId(Literature literature){literatureDao.updateUniqueId(literature);}
    @Override
      public Literature getLiteratureById(int id) {
        Literature literature= literatureDao.getLiteratureById(id);
        return literature;
    }
    @Override
    public Literature getLiteratureByIdOld(int id) {
        return literatureDao.getLiteratureByIdOld(id);
    }
    @Override
    public void relationFile(int relationId,int id){
      literatureDao.relationFile(relationId,id);
    }
    @Override
    public List<RecommendedItem> recommend(int userId) throws IOException, TasteException {
         int NEIGHBORHOOD_NUM = 2;
         int RECOMMENDER_NUM = 3;
        // String file = "src/data/testCF.csv";
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setServerName("localhost");
        dataSource.setUser("root");
        dataSource.setPassword("root");
        dataSource.setDatabaseName("baymax_test");
        JDBCDataModel dataModel = new MySQLJDBCDataModel(dataSource,"user_file_score","user_id","file_id","score","");
       DataModel model = dataModel;
        //  DataModel model = new FileDataModel(new File(file));
        UserSimilarity user = new EuclideanDistanceSimilarity(model);
        NearestNUserNeighborhood neighbor = new NearestNUserNeighborhood(NEIGHBORHOOD_NUM, user, model);
        Recommender r = new GenericUserBasedRecommender(model, neighbor, user);
        LongPrimitiveIterator iter = model.getUserIDs();
        while (iter.hasNext()) {
            long uid = iter.nextLong();
            if(Integer.parseInt(String.valueOf(uid))==userId) {
                List<RecommendedItem> list = r.recommend(uid, RECOMMENDER_NUM);
                for (RecommendedItem ritem : list) {
                   // System.out.printf("(%s,%f)", ritem.getItemID(), ritem.getValue());
                }
                return list;
            }
        }
        return null;
    }
}
