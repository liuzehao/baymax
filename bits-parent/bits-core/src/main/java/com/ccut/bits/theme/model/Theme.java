/*
* Theme.java
* Created on  202015/5/22 13:38
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/5/22       longshihui    初始版本
*
*/

package com.ccut.bits.theme.model;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
public class Theme {
    private int id;
    private String img;
    private String themeName;
    private String keyWord;

    public String getThemeName() {
        return themeName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setThemeName(String themeName) {
        this.themeName = themeName;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
