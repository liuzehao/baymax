/*
* RelationDao.java
* Created on  2015/8/1 18:17
* 版本       修改时间          作者      修改内容
* V1.0.1    2015/8/1       longshihui    初始版本
*
*/

package com.ccut.bits.relation.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.model.Relation;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
@mybatisScan
public interface RelationDao {

    List<Relation> getThemeRelation();

    List<Relation> getExpertRelation();

    List<Relation> getPatentRelation();
}
