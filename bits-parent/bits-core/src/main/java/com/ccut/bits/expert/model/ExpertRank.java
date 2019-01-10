/*
* ExpertRank.java
* Created on  202015/5/22 20:55
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/5/22       longshihui    初始版本
*
*/

package com.ccut.bits.expert.model;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
public class ExpertRank extends Expert{
    private int literatureCount;
    private int patentCount;

    public int getLiteratureCount() {
        return literatureCount;
    }

    public void setLiteratureCount(int literatureCount) {
        this.literatureCount = literatureCount;
    }

    public int getPatentCount() {
        return patentCount;
    }

    public void setPatentCount(int patentCount) {
        this.patentCount = patentCount;
    }
}
