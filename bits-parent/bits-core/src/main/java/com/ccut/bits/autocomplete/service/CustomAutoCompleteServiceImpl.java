/*
* CustomAutoCompleteServiceImpl.java
* Created on  202015/2/17 19:49
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/17     panzhuowen    初始版本
*
*/

package com.ccut.bits.autocomplete.service;

import com.ccut.bits.autocomplete.dao.AutoCompleteDao;
import com.ccut.bits.model.AutoComplete;
import com.ccut.bits.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@Service("autoCompleteService")
public class CustomAutoCompleteServiceImpl extends AbstractAutoCompleteService implements AutoCompleteService{
    @Autowired
    private AutoCompleteDao autoCompleteDao;

    @Override
    @PostConstruct
    public void initAutoComplete() {
        super.initAutoComplete();
    }

    @Override
    protected void initAutoCompleteMap() {
        Map<String, List<AutoComplete>> autoCompleteMap = new HashMap<>();
        autoCompleteMap.put("roleAutoCompleteList",autoCompleteDao.getRoleAutoCompleteList());
        autoCompleteMap.put("themeAutoCompleteList", autoCompleteDao.getThemeAutoCompleteList());
        setAutoCompleteMap(autoCompleteMap);
    }
}
