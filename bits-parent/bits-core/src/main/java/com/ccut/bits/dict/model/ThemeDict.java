package com.ccut.bits.dict.model;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Demon on 2015/5/14.
 */
public class ThemeDict {
    private int id;
    private String themeName;
    private String keyWord;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getThemeName() {
        return themeName;
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

    public List<String> getDict(){
        List<String> list = new LinkedList<>();
        if(keyWord != null){
            String[] keywordArray = keyWord.split(" ");
            for (String str:keywordArray){
                list.add(str.trim());
            }
        }
        if(themeName != null)
            list.add(themeName);
        return list;
    }
}
