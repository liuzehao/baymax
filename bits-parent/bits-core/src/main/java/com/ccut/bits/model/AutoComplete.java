/*
* AutoComplete.java
* Created on  202015/2/17 19:35
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/17     panzhuowen    初始版本
*
*/

package com.ccut.bits.model;

import com.ccut.bits.plugin.Cn2Spell;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public class AutoComplete {
    private String id;
    private String name;
    private String spell;
    private String firstSpell;
    private String keyword;
    private boolean isShowAll;
    private String flag;
    private String sql;

    public AutoComplete() {
    }

    public AutoComplete(String id, String name) {
        this.id = id;
        this.name = name;
        this.setSpellAndFirstSpellByName();
    }

    public void setSpellAndFirstSpellByName() {
        this.setSpell(Cn2Spell.converterToSpell(this.getName()));
        this.setFirstSpell(Cn2Spell.converterToFirstSpell(this.getName()));
    }

    public boolean contain(String keyword) {
        return this.getSpell().contains(keyword) || this.getFirstSpell().contains(keyword) || this.getName().toLowerCase().contains(keyword);
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpell() {
        return this.spell;
    }

    public void setSpell(String spell) {
        this.spell = spell;
    }

    public String getFirstSpell() {
        return this.firstSpell;
    }

    public void setFirstSpell(String firstSpell) {
        this.firstSpell = firstSpell;
    }

    public String getKeyword() {
        return this.keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword.toLowerCase();
    }

    public boolean isShowAll() {
        return this.isShowAll;
    }

    public void setIsShowAll(boolean showAll) {
        this.isShowAll = showAll;
    }

    public String getFlag() {
        return this.flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getSql() {
        return this.sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }
}
