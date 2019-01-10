package com.ccut.bits.theme.service;

import com.ccut.bits.expert.dao.ExpertDao;
import com.ccut.bits.literature.dao.LiteratureDao;
import com.ccut.bits.model.Relation;
import com.ccut.bits.patent.dao.PatentDao;
import com.ccut.bits.relation.ThemeRelation;
import com.ccut.bits.theme.dao.ThemeDao;
import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.theme.model.ThemeTree;
import com.ccut.bits.theme.model.ThemeHot;
import com.ccut.bits.util.StringUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.*;

/**
 * Created by Demon on 2015/4/18.
 */
@Service("themeService")
@Lazy(false)
@Transactional
public class ThemeServiceImp implements ThemeService {
    @Autowired
    private ThemeDao themeDao;
    @Autowired
    private LiteratureDao literatureDao;
    @Autowired
    private PatentDao patentDao;
    @Autowired
    private ExpertDao expertDao;
    @Autowired
    private ThemeRelation themeRelation;
    private final Integer DEFAULT_TOP_SIZE = 10;
    @Override
    public Theme getParentThemeById(@Param("id")int id){
        return themeDao.getParentThemeById(id);
    }
    @Override
    public List<ThemeTree> getThemeTree() {
        List<ThemeTree> parentThemeTrees = themeDao.getParentTheme();
        List<ThemeTree> childThemeTrees = themeDao.getChildTheme();
        for (ThemeTree parentThemeTree : parentThemeTrees) {
            for (ThemeTree childThemeTree : childThemeTrees) {
                if (parentThemeTree.getId() == childThemeTree.getParentId())
                    parentThemeTree.getChildThemeTree().add(childThemeTree);
            }
        }
        return parentThemeTrees;
    }
    @Override
    public  List<Theme> getThemesByFileId(int id){
        return themeDao.getThemesByFileId(id);
    }


    @Override
    public List<String> getThemeNames() {
        List<Theme> themes = themeDao.getAllTheme();
        List<String> names = new LinkedList<>();
        for (Theme t:themes){
            names.add(t.getThemeName());
        }
        return names;
    }

    @Override
    public List<Theme> getCacheThemeNames() {
        return themeRelation.getCacheThemes();
    }

    @Override
    public List<Theme> getTopTheme() {
        return themeDao.getTopTheme(DEFAULT_TOP_SIZE);
    }

    @Override
    public Map<String, Integer> getChartData() {
        List<ThemeHot> themeHots = themeDao.getThemeHotByLiteratureNumDESC();
        Map<String,Integer> chartData = new HashMap<>();
        int otherCount = 0;
        ThemeHot themeHot;
        for (int i = 0; i < themeHots.size() && i < DEFAULT_TOP_SIZE; i++){
            themeHot = themeHots.get(i);
            chartData.put(themeRelation.getThemeName(themeHot.getId()),themeHot.getLiteratureNum());
        }
        for (int i = DEFAULT_TOP_SIZE; i < themeHots.size(); i++){
            themeHot = themeHots.get(i);
            otherCount += themeHot.getLiteratureNum();
        }
        if (otherCount != 0)
            chartData.put("其他领域",otherCount);
        return chartData;
    }

    @Override
    public Map<String, Integer> getDetailThemeChartData(Integer themeId) {
        if (themeId == null)
            return null;
        Map<String,Integer> chartData = new HashMap<>();
        int all = themeRelation.getCountAllExpert();
        int the = themeRelation.totalExpert(themeId);
        chartData.put(themeRelation.getThemeName(themeId),the);
        chartData.put("其他领域",all - the);
        return chartData;
    }

    @Override
    public List<Integer> getAllThemeId() {
        return themeDao.getAllThemeId();
    }

    @Override
    @Scheduled(cron = "0 0 0 * * ?")    //每天凌晨触发
    public void updateThemeHotScore() {
        List<ThemeHot> hots = themeDao.getAllThemeHot();
        int countLiterature = literatureDao.getTotalRecord();
        int countPatent = patentDao.getTotalRecord();
        int countExpert = expertDao.getTotalRecord();
        int totalVisit = 20000;
        double score;
        boolean flag = true;
        for (ThemeHot hot : hots) {
            score = 0;
            score += (double) hot.getLiteratureNum() / countLiterature;
            score += (double) hot.getPatentNum() / countPatent;
            score += (double) hot.getExpertNum() / countExpert;
            score += (double) hot.getUserVisit() / (6 * totalVisit);
            flag = flag && themeDao.updateThemeHotScoreById(hot.getId(), score);
        }
        if (flag) {
            System.out.println("更新主题热度成功");
        } else {
            System.out.println("更新主题热度失败");
        }
    }
    @Override
    public int getThemeIdByThemeName(String themeName){
        return themeDao.getThemeIdByThemeName(themeName);
    }
    @Override
    public List<Integer> getChildIds(@Param("parentIds")List<java.lang.Integer> parentIds){
        return themeDao.getChildIds(parentIds);
    }
    @Override
    public String getThemeNameById(@Param("id")int id){
        return themeDao.getThemeNameById(id);
    }
}
