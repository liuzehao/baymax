package com.ccut.bits.expert.service;

import com.ccut.bits.constant.Constant;
import com.ccut.bits.expert.dao.ExpertDao;
import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.expert.model.ExpertRank;
import com.ccut.bits.literature.dao.LiteratureDao;
import com.ccut.bits.lucene.LuceneSearch;
import com.ccut.bits.page.Page;
import com.ccut.bits.patent.dao.PatentDao;
import com.ccut.bits.relation.ExpertRelation;
import com.ccut.bits.relation.PatentRelation;
import com.ccut.bits.relation.RelationHandle;
import com.ccut.bits.relation.ThemeRelation;
import com.ccut.bits.theme.dao.ThemeDao;
import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.util.StringUtil;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.Filter;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.QueryWrapperFilter;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.util.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.util.*;

/**
 * Created by Demon on 2015/4/14.
 */
@Service("expertService")
public class ExpertServiceImp implements ExpertService {
    @Autowired
    private ExpertDao expertDao;
    @Autowired
    private ThemeDao themeDao;
    @Autowired
    private ExpertRelation expertRelation;
    @Autowired
    private ThemeRelation themeRelation;
    @Autowired
    private RelationHandle relationHandle;
    @Autowired
    private LuceneSearch searcher;
    private String[] literaFields;
    private String[] patentFields;
    private Filter literatureFilter;
    private Filter patentFilter;
    private int DEFAULT_TOP_THEME_SIZE = 5;
    private int DEFAULT_TOP_EXPERT_SIZE = 10;

    public ExpertServiceImp() {
        literaFields = new String[]{
                Constant.Index.Literature.FIELD_TITLE,
                Constant.Index.Literature.FIELD_ABS,
                Constant.Index.Literature.FIELD_KEY
        };
        patentFields = new String[]{
                Constant.Index.Patent.FIELD_TITLE,
                Constant.Index.Patent.FIELD_ABS
        };
        literatureFilter = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.LITERATURE)));
        patentFilter = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.PATENT)));
    }

    private void setExpertTheme(Collection<? extends Expert> experts) {
        Set<Integer> themes;
        for (Expert expert : experts) {
            this.setExpertTheme(expert);
        }
    }

    private void setExpertTheme(Expert expert) {
        Set<Integer> themes = expertRelation.getThemeIds(expert.getId());
        ;
        expert.setThemeList((List<Theme>) themeRelation.getThemes(themes));
    }

    @Override
    public List<Expert> getAllExpert(Page page) {
        Integer size = page.getPageSize();
        Integer begin = (page.getPageNo() - 1) * page.getPageSize();
        List<Expert> experts = expertDao.getAllExpert(begin, size);
        this.setExpertTheme(experts);
        return experts;
    }

    @Override
    public List<Expert> getExpertByNames(String[] names) {
        if (names.length == 0) return new LinkedList<>();
        List<Expert> experts = expertDao.getExpertByNames(names);
        this.setExpertTheme(experts);
        return experts;
    }

    @Override
    public Expert getExpertById(int id) {
        Expert expert = expertDao.getExpertById(id);
        if (expert == null)
            return null;
        this.setExpertTheme(expert);
        return expert;
    }

    @Override
    public List<Expert> getExpertsByIds(Collection<Integer> ids) {
        if (ids.size() == 0)
            return new LinkedList<>();
        List<Expert> experts = expertDao.getExpertsByIds(new LinkedList<>(ids));
        this.setExpertTheme(experts);
        return experts;
    }

    @Override
    public Map<String, List<ExpertRank>> getRecommend(String content) {
        List<Integer> literaIds = new LinkedList<>();
        HashSet<String> inventors = new HashSet<>();
        //利用set去重的机制，进行专家主题分类
        HashSet<Integer> themeIdsSet = new HashSet<>();
        //最终的主题id链表
        List<Integer> themeIdsList = new LinkedList<>();
        Map<String, List<ExpertRank>> result = new HashMap<>();
        Query literaQuery = null;
        Query patentQuery = null;

        try {
            literaQuery = new MultiFieldQueryParser(Version.LUCENE_47, literaFields, new IKAnalyzer()).parse(content);
            patentQuery = new MultiFieldQueryParser(Version.LUCENE_47, patentFields, new IKAnalyzer()).parse(content);
        } catch (ParseException e) {
            System.out.println(e.toString());
        }

        List<Document> literaDocs = searcher.search(literaQuery, literatureFilter);
        List<Document> patentDocs = searcher.search(patentQuery, patentFilter);

        for (Document doc : literaDocs) {
            literaIds.add(Integer.parseInt(doc.get(Constant.Index.Literature.FIELD_ID)));
        }
        for (Document doc : patentDocs) {
            inventors.add(doc.get(Constant.Index.Patent.FIELD_INVENTOR));
        }

        if (!literaIds.isEmpty()) {
            themeIdsSet.addAll(themeDao.getThemeIdsByLiteratureIds(literaIds));
        }
        if (!inventors.isEmpty()) {
            //通过名字对出专家id
            List<Integer> expertsIds = expertDao.getExpertIdsByExpertNames(StringUtil.SetToList(inventors));
            if (!expertsIds.isEmpty())
                //通过专家id找出对应的主题id
                themeIdsSet.addAll(expertRelation.getThemeIds(expertsIds));
        }
        themeIdsList.addAll(themeIdsSet);
        //对找出可能涉及的主题进行主题热度分析
        //若主题个数大于默认top数 则进行热度分析
        if (themeIdsList.size() > DEFAULT_TOP_THEME_SIZE) {
            themeIdsList = themeDao.getTopThemeIdsByIds(themeIdsList, DEFAULT_TOP_THEME_SIZE);
        }
        //收集最后结果集
        String themeName = null;
        List<ExpertRank> expertRanks = null;
        for (int themeId : themeIdsList) {
            themeName = themeRelation.getThemeName(themeId);
            expertRanks = this.getTopExpertRankByThemeId(themeId, DEFAULT_TOP_EXPERT_SIZE);
            result.put(themeName, expertRanks);
        }
        return result;
    }

    @Override
    @Deprecated
    public List<ExpertRank> getTopExpertRankByThemeId(int id, int total) {
        List<ExpertRank> expertRanks = expertDao.getTopExpertRankByThemeId(id, total);
        this.setExpertTheme(expertRanks);
        for (ExpertRank expertRank : expertRanks) {
            expertRank.setLiteratureCount(expertRelation.totalLiterature(expertRank.getId()));
            expertRank.setPatentCount(expertRelation.totalPatent(expertRank.getExpertName()));
        }
        return expertRanks;
    }

    @Override
    @Scheduled(cron = "0 0 0 * * ?")
    public void updateExpertScore() {
        List<Expert> experts = expertDao.getAllExpert(null, null);
        int countLiterature = 0;
        int countPatent = 0;
        for (Expert expert : experts) {
            countLiterature = expertRelation.totalLiterature(expert.getId());
            countPatent = expertRelation.totalPatent(expert.getExpertName());
            expertDao.updateExpertScore(expert.getId(), countLiterature + countPatent);
        }
        System.out.println("专家评分更新成功");
    }

    @Override
    public int getTotalRecord() {
        return expertDao.getTotalRecord();
    }

    @Override
    public int getTotalExpertByThemeId(int id) {
        return themeRelation.totalExpert(id);
    }


    @Override
    public List<Expert> getExpertListPage(Expert expert) {
        List<Expert> list = expertDao.getExpertListPage(expert);
        for (Expert data : list) {
            data.setThemeList((List<Theme>) themeRelation.getThemes(expertRelation.getThemeIds(data.getId())));
        }
        return list;
    }

    @Override
    public void addExpert(Expert expert, String[] themeNames) {
        expertDao.addExpertInfo(expert);
//        expertDao.addExpertTheme(expert.getId(), expert.getThemeList().get(0).getId());
        List<Integer> themeIds = new LinkedList<>();
        for (String name : themeNames) {
            themeIds.add(themeRelation.getThemeId(name));
        }
        relationHandle.updateExpertTheme(expert.getId(), themeIds);
    }

    @Override
    public void deleteExpert(int id) {
        expertDao.deleteExpert(id);
    }

    @Override
    public void editExpert(Expert expert, String[] themeNames) {
        relationHandle.updateExpertTheme(expert.getId(), themeRelation.getThemeIds(themeNames));
        expertDao.editExpert(expert);
    }
}
