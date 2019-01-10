/*
* PatentRelation.java
* Created on  2015/8/1 18:12
* 版本       修改时间          作者      修改内容
* V1.0.1    2015/8/1       longshihui    初始版本
*
*/

package com.ccut.bits.relation;

import com.ccut.bits.model.Relation;
import com.ccut.bits.relation.dao.RelationDao;
import org.aspectj.lang.annotation.Pointcut;
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
public class PatentRelation {
    @Autowired
    private RelationDao relationDao;

    private Map<String, Set<Integer>> patentRelation;

    @PostConstruct
    private void init() {
        System.out.println("专利数据初始化中...");
        List<Relation> relations = relationDao.getPatentRelation();
        patentRelation = new HashMap<>();
        Set<Integer> patentIds;
        for (Relation relation : relations) {
            patentIds = new HashSet<>();
            for (String id : relation.getPatentInfoId().split(",")) {
                patentIds.add(Integer.valueOf(id.trim()));
            }
            patentRelation.put(relation.getExpertName(), patentIds);
        }
        System.out.println("专利数据初始化完成...");
    }

    public Set<Integer> getPatentIds(String expertName) {
        return patentRelation.get(expertName);
    }

    public Set<Integer> getPatentIds(Collection<String> expertNames) {
        Set<Integer> re = new HashSet<>();
        Set<Integer> t;
        for (String name : expertNames) {
            t = this.getPatentIds(name);
            if (t == null)
                continue;
            re.addAll(t);
        }
        return re;
    }
}
