/*
* Relation.java
* Created on  2015/8/1 13:51
* 版本       修改时间          作者      修改内容
* V1.0.1    2015/8/1       longshihui    初始版本
*
*/

package com.ccut.bits.model;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
public class Relation {
    private int id;
    private String themeTypeId;
    private String expertInfoId;
    private String intelligenceInfoId;
    private String patentInfoId;
    private String literatureInfoId;
    private String informationTypeId;
    private String expertName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getThemeTypeId() {
        return themeTypeId;
    }

    public void setThemeTypeId(String themeTypeId) {
        this.themeTypeId = themeTypeId;
    }

    public String getExpertInfoId() {
        return expertInfoId;
    }

    public void setExpertInfoId(String expertInfoId) {
        this.expertInfoId = expertInfoId;
    }

    public String getIntelligenceInfoId() {
        return intelligenceInfoId;
    }

    public void setIntelligenceInfoId(String intelligenceInfoId) {
        this.intelligenceInfoId = intelligenceInfoId;
    }

    public String getPatentInfoId() {
        return patentInfoId;
    }

    public void setPatentInfoId(String patentInfoId) {
        this.patentInfoId = patentInfoId;
    }

    public String getLiteratureInfoId() {
        return literatureInfoId;
    }

    public void setLiteratureInfoId(String literatureInfoId) {
        this.literatureInfoId = literatureInfoId;
    }

    public String getInformationTypeId() {
        return informationTypeId;
    }

    public void setInformationTypeId(String informationTypeId) {
        this.informationTypeId = informationTypeId;
    }

    public String getExpertName() {
        return expertName;
    }

    public void setExpertName(String expertName) {
        this.expertName = expertName;
    }
}
