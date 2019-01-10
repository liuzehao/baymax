/*
* RelationHandle.java
* Created on  2015/8/3 10:18
* 版本       修改时间          作者      修改内容
* V1.0.1    2015/8/3       longshihui    初始版本
*
*/

package com.ccut.bits.relation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
@Component
public class RelationHandle {
    @Autowired
    private ExpertRelation expertRelation;
    @Autowired
    private LiteratureRelation literatureRelation;
    @Autowired
    private ThemeRelation themeRelation;

    public void updateExpertTheme(Integer expertId,Collection<Integer> themeIds){
        expertRelation.updateTheme(expertId, themeIds);
        List<Integer> expertIds = new LinkedList<>();
        expertIds.add(expertId);
        for (Integer themeId:themeIds){
            themeRelation.updateExpert(themeId,expertIds);
        }
    }
}
