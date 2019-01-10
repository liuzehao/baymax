/*
* AbstractAutoCompleteService.java
* Created on  202015/2/17 19:45
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/17     panzhuowen    初始版本
*
*/

package com.ccut.bits.autocomplete.service;

import com.ccut.bits.autocomplete.dao.AutoCompleteBaseDao;
import com.ccut.bits.model.AutoComplete;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public abstract class AbstractAutoCompleteService {
    private Map<String, List<AutoComplete>> autoCompleteMap;
    @Autowired
    private AutoCompleteBaseDao autoCompleteBaseDao;

    public AbstractAutoCompleteService() {
    }

    public void initAutoComplete() {
        this.initAutoCompleteMap();
        this.initAutoCompleteSpell();
    }

    protected abstract void initAutoCompleteMap();

    private void initAutoCompleteSpell() {
        Map map = this.getAutoCompleteMap();
        Iterator i$ = map.keySet().iterator();

        while(i$.hasNext()) {
            String str = (String)i$.next();
            this.initAutoCompleteSpell((List)map.get(str));
        }

    }

    protected void initAutoCompleteSpell(List<AutoComplete> list) {
        if(list != null) {
            Iterator i$ = list.iterator();

            while(i$.hasNext()) {
                AutoComplete autoCompleteVO = (AutoComplete)i$.next();
                autoCompleteVO.setSpellAndFirstSpellByName();
            }

        }
    }

    public List<AutoComplete> getAutoCompleteResultList(AutoComplete autoCompleteParam) {
        return this.getMatchAutoCompleteList(autoCompleteParam, this.getAllAutoCompleteList(autoCompleteParam));
    }

    private List getAllAutoCompleteList(AutoComplete autoCompleteParam) {
        List autoCompleteList;
        if(autoCompleteParam.getSql() != null && !autoCompleteParam.getSql().equals("")) {
            autoCompleteList = this.autoCompleteBaseDao.findAutoCompleteList(autoCompleteParam.getSql());
            this.initAutoCompleteSpell(autoCompleteList);
        } else {
            autoCompleteList = (List)this.getAutoCompleteMap().get(autoCompleteParam.getFlag());
        }

        return autoCompleteList;
    }

    protected List<AutoComplete> getMatchAutoCompleteList(AutoComplete autoCompleteParam, List<AutoComplete> autoCompleteList) {
        ArrayList autoCompleteResultList = new ArrayList();
        if(autoCompleteList != null && autoCompleteList.size() > 0) {
            Iterator i$ = autoCompleteList.iterator();

            while(i$.hasNext()) {
                AutoComplete autoCompleteVO = (AutoComplete)i$.next();
                if(!autoCompleteParam.isShowAll() && autoCompleteResultList.size() >= 10) {
                    break;
                }

                if(autoCompleteVO.contain(autoCompleteParam.getKeyword())) {
                    autoCompleteResultList.add(autoCompleteVO);
                }
            }

            return autoCompleteResultList;
        } else {
            return autoCompleteList;
        }
    }

    public Map<String, List<AutoComplete>> getAutoCompleteMap() {
        return this.autoCompleteMap;
    }

    public void setAutoCompleteMap(Map<String, List<AutoComplete>> autoCompleteMap) {
        this.autoCompleteMap = autoCompleteMap;
    }
}
