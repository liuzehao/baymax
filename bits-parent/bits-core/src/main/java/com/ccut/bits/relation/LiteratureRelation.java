/*
* LiteratureRelation.java
* Created on  2015/8/1 18:12
* 版本       修改时间          作者      修改内容
* V1.0.1    2015/8/1       longshihui    初始版本
*
*/

package com.ccut.bits.relation;

import com.ccut.bits.literature.dao.LiteratureDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.Set;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
@Component
@Lazy(false)
public class LiteratureRelation {
    @Autowired
    private LiteratureDao literatureDao;

    private Map<Integer, Map<String, Set<Integer>>> themeRelation;
}
