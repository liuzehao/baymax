package com.ccut.bits.dict.model;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Demon on 2015/5/14.
 */
public class LiteratureDict {
    private String key;

    public String getKeywords() {
        return key;
    }

    public void setKeywords(String keywords) {
        this.key = keywords;
    }

    public List<String> getDict() {
        List<String> list = new LinkedList<>();
        if (key != null) {
            String[] keywordArray = key.split(";");
            for (String str : keywordArray) {
                if (!"".equals(str.trim()))
                    list.add(str.trim());
            }
        }
        return list;
    }
}
