/*
* Score.java
* Created on  2015/8/19 12:28
* 版本       修改时间          作者      修改内容
* V1.0.1    2015/8/19       longshihui    初始版本
*
*/

package com.ccut.bits.autoanswer.model;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
public class Score {
    private Float score;

    public Score(Float score){
        this.score = score;
    }

    public Score(){}

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }
}
