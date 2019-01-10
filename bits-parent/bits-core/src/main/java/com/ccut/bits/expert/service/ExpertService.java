package com.ccut.bits.expert.service;

import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.expert.model.ExpertRank;
import com.ccut.bits.page.Page;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * Created by Demon on 2015/4/14.
 */
public interface ExpertService {
    List<Expert> getAllExpert(Page page);

    List<Expert> getExpertByNames(String[] names);

    Expert getExpertById(int id);

    List<Expert> getExpertsByIds(Collection<Integer> ids);

    Map<String, List<ExpertRank>> getRecommend(String content);

    List<ExpertRank> getTopExpertRankByThemeId(int id, int total);

    void updateExpertScore();

    int getTotalRecord();

    int getTotalExpertByThemeId(int id);

    List<Expert> getExpertListPage(Expert expert);

    void addExpert(Expert expert, String[] themeNames);

    void deleteExpert(int id);

    void editExpert(Expert expert, String[] themeNames);
}
