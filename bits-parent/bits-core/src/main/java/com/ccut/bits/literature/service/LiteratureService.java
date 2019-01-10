package com.ccut.bits.literature.service;

import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.page.Page;
import org.apache.ibatis.annotations.Param;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;

import java.io.IOException;
import java.util.List;

/**
 * Created by Demon on 2015/4/11.
 */
public interface LiteratureService {
    List<Literature> getAllLiterature(Page page);

    List<Literature> getAllFile(Page page);

    int getTotalRecord();

    int getTotalRecordByThemeId(int themeId);

    String getTypeGeneralbyTypeName(String type);

    List<Literature> getLiteratureByThemeId(int themeId,Page page);

    List<Literature> getLiteratureByThemeIdLimtNum(int themeId,int begin,int end);

    List<Literature> getAllLiteratureByThemeId(int themeId);

    List<Literature>getRelationByFileId(int id);

    Literature getLiteratureById(int id);

    List<Literature> getLiteraturesByIds(List<Integer> ids);


    void setGeneralFile(int fileId,int userId,String time);

    void setScore(int fileId,int userId,int score);//针对用户偏爱表

    void setTotleScore(int fileId,int score);

    List<Literature> getLiteratureListPage(Literature literature);

    List<RecommendedItem> recommend(int userId)throws IOException, TasteException;//推荐

    void delLiterature(int id);

    void addLiterature(Literature literature);

    void editLiterature(Literature literature,String[] themeNames);

   void relationFile(int relationId,int id);

    int fileUniqueId(String themeName,String type,String fileId);

    void updateUniqueId(Literature literature);

    Literature getLiteratureByIdOld(int id);
}
