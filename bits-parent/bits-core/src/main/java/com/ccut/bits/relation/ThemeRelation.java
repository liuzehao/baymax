/*
* ThemeRelation.java
* Created on  2015/8/1 18:08
* 版本       修改时间          作者      修改内容
* V1.0.1    2015/8/1       longshihui    初始版本
*
*/

package com.ccut.bits.relation;

import com.ccut.bits.model.Relation;
import com.ccut.bits.relation.dao.RelationDao;
import com.ccut.bits.theme.dao.ThemeDao;
import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import sun.misc.Cache;

import javax.annotation.PostConstruct;
import java.util.*;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
@Component
@Lazy(false)
public class ThemeRelation {
    @Autowired
    private RelationDao relationDao;
    @Autowired
    private ThemeDao themeDao;


    private enum KEY {
        LITERATURE_IDS,
        EXPERT_IDS
    }

    private Map<Integer, Map<String, Set<Integer>>> themeRelation;
    private Map<Integer, Theme> themeIdToTheme;
    private Map<String, Theme> themeNameToTheme;
    private List<Theme> cacheThemes;
    private Integer countAllExpert = 0;

    @PostConstruct
    private void init() {
        System.out.println("主题数据初始化中...");
        getThemeRelation();
        getThemeList();
        countAllExpert();
        System.out.println("主题数据初始化完成!");
    }

    private void getThemeRelation() {
        List<Relation> relations = relationDao.getThemeRelation();
        themeRelation = new HashMap<>();
        Map<String, Set<Integer>> wrapper;
        Set<Integer> expertIds;
        Set<Integer> literatureIds;
        for (Relation relation : relations) {
            expertIds = new HashSet<>();
            for (String s : relation.getExpertInfoId().split(",")) {
                expertIds.add(Integer.valueOf(s.trim()));
            }
            literatureIds = new HashSet<>();
            for (String s : relation.getLiteratureInfoId().split(",")) {
                literatureIds.add(Integer.valueOf(s.trim()));
            }
            wrapper = new HashMap<>();
            wrapper.put(KEY.EXPERT_IDS.name(), expertIds);
            wrapper.put(KEY.LITERATURE_IDS.name(), literatureIds);
            themeRelation.put(Integer.valueOf(relation.getThemeTypeId()), wrapper);
        }
    }

    private void getThemeList() {
        this.cacheThemes = themeDao.getAllTheme();
        themeIdToTheme = new HashMap<>();
        themeNameToTheme = new HashMap<>();
        for (Theme t : cacheThemes) {
            themeIdToTheme.put(t.getId(), t);
            themeNameToTheme.put(t.getThemeName(), t);
        }
    }

    private int total(Integer themeId, KEY K) {
        Map<String, Set<Integer>> dataWrapper = themeRelation.get(themeId);
        return dataWrapper == null ? 0 : dataWrapper.get(K.name()).size();
    }

    private void countAllExpert(){
        for (Integer id:themeRelation.keySet()){
            this.countAllExpert += this.total(id,KEY.EXPERT_IDS);
        }
    }

    public Integer getCountAllExpert(){
        return this.countAllExpert;
    }

    public List<Theme> getCacheThemes(){
        return cacheThemes;
    }

    public String getThemeName(Integer themeId) {
        if (themeIdToTheme.get(themeId) == null)
            return null;
        return themeIdToTheme.get(themeId).getThemeName();
    }

    public Integer getThemeId(String themeName) {
        if (themeNameToTheme.get(themeName) == null)
            return null;
        return themeNameToTheme.get(themeName).getId();
    }

    public Collection<Integer> getThemeIds(String[] themeNames) {
        Set<Integer> themeIds = new HashSet<>();
        for (String s : themeNames) {
            themeIds.add(themeNameToTheme.get(s).getId());
        }
        return themeIds;
    }

    public Set<Integer> getLiteratureIds(Integer themeId) {
        Map<String, Set<Integer>> dataWrapper = themeRelation.get(themeId);
        return dataWrapper == null ? new HashSet<Integer>() : dataWrapper.get(KEY.LITERATURE_IDS.name());
    }

    public Theme getTheme(Integer themeId) {
        return themeIdToTheme.get(themeId);
    }

    public Collection<Theme> getThemes(Collection<Integer> themeIds) {
        List<Theme> re = new LinkedList<>();
        Theme theme;
        for (Integer id : themeIds) {
            theme = themeIdToTheme.get(id);
            if (theme == null)
                continue;
            re.add(theme);
        }
        return re;
    }

    public Set<Integer> getExpertIds(Integer themeId) {
        Map<String, Set<Integer>> dataWrapper = themeRelation.get(themeId);
        return dataWrapper == null ? new HashSet<Integer>() : dataWrapper.get(KEY.EXPERT_IDS.name());
    }

    public int totalLiterature(Integer themeId) {
        return this.total(themeId, KEY.LITERATURE_IDS);
    }

    public int totalLiterature(String themeName) {
        Theme theme = themeNameToTheme.get(themeName);
        return theme == null ? 0 : this.totalLiterature(theme.getId());
    }

    public int totalExpert(Integer themeId) {
        return this.total(themeId, KEY.EXPERT_IDS);
    }

    public int totalExpert(String themeName) {
        Theme theme = themeNameToTheme.get(themeName);
        return theme == null ? 0 : this.totalExpert(theme.getId());
    }

    public void updateExpert(Integer themeId, Collection<Integer> expertIds) {
        Map<String, Set<Integer>> wrapper = themeRelation.get(themeId);
        if (wrapper == null)
            return;
        wrapper.get(KEY.EXPERT_IDS.name()).addAll(expertIds);
    }

}
