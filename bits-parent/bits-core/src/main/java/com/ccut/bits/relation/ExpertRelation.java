/*
* ExpertRelation.java
* Created on  2015/8/1 18:12
* 版本       修改时间          作者      修改内容
* V1.0.1    2015/8/1       longshihui    初始版本
*
*/

package com.ccut.bits.relation;

import com.ccut.bits.model.Relation;
import com.ccut.bits.relation.dao.RelationDao;
import com.ccut.bits.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

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
public class ExpertRelation {
    @Autowired
    private RelationDao relationDao;
    @Autowired
    private PatentRelation patentRelation;

    private Map<Integer, Map<String, Set<Integer>>> expertRelation;

    private enum KEY {
        THEME_IDS,
        LITERATURE_IDS
    }

    @PostConstruct
    private void init() {
        System.out.println("专家数据初始化中...");
        List<Relation> relations = relationDao.getExpertRelation();
        expertRelation = new HashMap<>();
        Map<String, Set<Integer>> wrapper;
        Set<Integer> themeIds;
        Set<Integer> literatureIds;
        for (Relation relation : relations) {
            wrapper = this.createWrapper();
            themeIds = new HashSet<>();
            literatureIds = new HashSet<>();
            for (String id : relation.getThemeTypeId().split(",")) {
                themeIds.add(Integer.valueOf(id.trim()));
            }
            for (String id : relation.getLiteratureInfoId().split(",")) {
                literatureIds.add(Integer.valueOf(id.trim()));
            }
            this.updateWrapperData(wrapper,KEY.THEME_IDS,themeIds);
            this.updateWrapperData(wrapper,KEY.LITERATURE_IDS,literatureIds);
            expertRelation.put(Integer.valueOf(relation.getExpertInfoId().trim()), wrapper);
        }
        System.out.println("专家数据初始化完毕...");
    }

    private Map<String, Set<Integer>> createWrapper() {
        Map<String, Set<Integer>> wrapper = new HashMap<>();
        for (KEY key : KEY.values()) {
            wrapper.put(key.name(),new HashSet<Integer>());
        }
        return wrapper;
    }

    private void updateWrapperData(Map<String, Set<Integer>> wrapper,KEY key,Collection<Integer> data){
        wrapper.get(key.name()).addAll(data);
    }

    private void addExpert(Integer expertId){
        Map<String, Set<Integer>> wrapper = this.createWrapper();
        expertRelation.put(expertId,wrapper);
    }

    public Set<Integer> getThemeIds(Integer expertId) {
        Map<String, Set<Integer>> wrapper = expertRelation.get(expertId);
        return wrapper == null ? new HashSet<Integer>() : wrapper.get(KEY.THEME_IDS.name());
    }

    public Set<Integer> getLiteratureIds(Integer expertId) {
        Map<String, Set<Integer>> wrapper = expertRelation.get(expertId);
        return wrapper == null ? new HashSet<Integer>() : wrapper.get(KEY.LITERATURE_IDS.name());
    }

    public Set<Integer> getThemeIds(Collection<Integer> expertIds) {
        Set<Integer> re = new HashSet<>();
        for (Integer id : expertIds) {
            re.addAll(this.getThemeIds(id));
        }
        return re;
    }

    public Set<Integer> getLiteratureIds(Collection<Integer> expertIds) {
        Set<Integer> re = new HashSet<>();
        for (Integer id : expertIds) {
            re.addAll(this.getLiteratureIds(id));
        }
        return re;
    }

    public int totalLiterature(Integer expertId) {
        return this.getLiteratureIds(expertId).size();
    }

    public int totalTheme(Integer expertId) {
        return this.getThemeIds(expertId).size();
    }

    public int totalPatent(String expertName) {
        Set<Integer> patentIds = patentRelation.getPatentIds(expertName);
        return patentIds == null ? 0 : patentIds.size();
    }

    public void updateTheme(Integer expertId, Collection<Integer> themeIds) {
        Map<String, Set<Integer>> wrapper = expertRelation.get(expertId);
        if (wrapper == null) {
            this.addExpert(expertId);
            wrapper = expertRelation.get(expertId);
        }
        this.updateWrapperData(wrapper,KEY.THEME_IDS,themeIds);
    }

    public void updateLiterature(Integer expertId, Collection<Integer> literatureIds){
        Map<String, Set<Integer>> wrapper = expertRelation.get(expertId);
        if (wrapper == null) {
            this.addExpert(expertId);
            wrapper = expertRelation.get(expertId);
        }
        this.updateWrapperData(wrapper,KEY.THEME_IDS,literatureIds);
    }
}
