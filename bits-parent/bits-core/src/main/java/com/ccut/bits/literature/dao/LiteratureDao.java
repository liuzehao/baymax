package com.ccut.bits.literature.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.dict.model.LiteratureDict;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Demon on 2015/4/11.
 */
@mybatisScan
public interface LiteratureDao {
    List<Literature> getAllLiterature(@Param("begin") Integer begin, @Param("size") Integer size);

    List<Literature> getAllFile(@Param("begin") Integer begin, @Param("size") Integer size);

    int getTotalRecord();

    int getTotalRecordByThemeId(@Param("themeId")int themeId);

    List<Literature> getLiteratureByThemeId(@Param("themeId")int themeId,@Param("begin")int begin,@Param("size")int size);

    List<Literature> getAllLiteratureByThemeId(@Param("themeId")int themeId);

    Literature getLiteratureById(@Param("id")int id);

    List<Literature> getRelationByFileId(@Param("id")int id);

    Literature getLiteratureByIdOld(@Param("id")int id);

    void setGeneralFile(@Param("fileId")int fileId,@Param("userId")int userId,@Param("time")String time);

    void setScore(@Param("fileId")int fileId,@Param("userId")int userId,@Param("score")int  score);

    void setTotleScore(@Param("fileId")int fileId,@Param("score")int  score);

    void addScorePeople(@Param("fileId")int fileId);

    List<Literature> getLiteraturesByIds(@Param("ids")List<Integer> ids);

    int countLiteratureByExpertId(@Param("id")int id);

    List<Integer> getLiteratureIdsByExpertId(@Param("id")int id);

    List<Literature> getLiteratureListPage(Literature literature);

    void delLiterature(@Param("id")int id);

    void addLiterature(Literature literature);

    void editLiterature(Literature literature);

    void updateUniqueId(Literature literature);

    void addLiteratureTheme(@Param("fileId")int fileId,@Param("themeId")int themeId);//文件主题关联表

    void relationFile(@Param("relationId")int relationId,@Param("id")int id);

    int getTypeIdbyTypeName(@Param("type")String type);

    String getTypeGeneralbyTypeName(@Param("type")String type);

    Literature getLiteratureByFileName(@Param("fileName")String fileName);
}
