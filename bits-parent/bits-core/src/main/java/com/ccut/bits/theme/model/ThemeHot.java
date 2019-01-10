/*
* ThemeHot.java
* Created on  202015/5/20 15:23
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/5/20       longshihui    初始版本
*
*/

package com.ccut.bits.theme.model;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
public class ThemeHot {
    private int id;
    private int patentNum;
    private int userVisit;
    private int expertNum;
    private int literatureNum;
    private double score;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPatentNum() {
        return patentNum;
    }

    public void setPatentNum(int patentNum) {
        this.patentNum = patentNum;
    }

    public int getUserVisit() {
        return userVisit;
    }

    public void setUserVisit(int userVisit) {
        this.userVisit = userVisit;
    }

    public int getExpertNum() {
        return expertNum;
    }

    public void setExpertNum(int expertNum) {
        this.expertNum = expertNum;
    }

    public int getLiteratureNum() {
        return literatureNum;
    }

    public void setLiteratureNum(int literatureNum) {
        this.literatureNum = literatureNum;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}
