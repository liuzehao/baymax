/*
* AutoCompleteBaseDao.java
* Created on  202015/2/17 19:46
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/17     panzhuowen    初始版本
*
*/

package com.ccut.bits.autocomplete.dao;

import com.ccut.bits.annotation.mybatisScan;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@mybatisScan
public interface AutoCompleteBaseDao {

    List findAutoCompleteList(String sql);
}
