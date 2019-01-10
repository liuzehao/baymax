package com.ccut.bits.expert.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.expert.model.ExpertRank;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

/**
 * Created by Demon on 2015/4/14.
 */
@mybatisScan
public interface ExpertDao {
    List<Expert> getAllExpert(@Param("begin") Integer begin, @Param("size") Integer size);

    List<Expert> getExpertsByIds(@Param("ids")Collection<Integer> ids);

    List<Expert> getExpertByNames(@Param("names")String[] names);

    Expert getExpertById(@Param("id")int id);

    List<Integer> getExpertIdsByExpertNames(@Param("names")List<String> names);

    List<ExpertRank> getTopExpertRankByThemeId(@Param("id")int id,@Param("topSize")int topSize);

    List<Integer> getTopExpert(@Param("expertIds")Collection<Integer> expertIds);

    void updateExpertScore(@Param("expertId")int expertId,@Param("score")int score);

    int getTotalRecord();

    int getTotalExpertByThemeId(@Param("themeId")int id);
    //以下涉及后台

    List<Expert> getExpertListPage(Expert expert);

    String getExpertOrgByExpertId(@Param("id") int id);

    int addExpertInfo(Expert expert);

    void addExpertTheme(@Param("expertId") int expertId, @Param("themeId") int themeId);

    void deleteExpert(@Param("id") int id);

    void editExpert(Expert expert);

    List<String> getExpertRelationshipByThemeId(@Param("themeId") int themeId);
}
