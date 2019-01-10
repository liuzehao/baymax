package com.ccut.bits.autoanswer.model;

import com.ccut.bits.expert.model.Expert;

import java.util.List;

/**
 * Created by Demon on 2015/5/17.
 */
public class Solution {
    private String content = "专家组暂时无法回答该问题";
    private List<Expert> experts = null;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Expert> getExperts() {
        return experts;
    }

    public void setExperts(List<Expert> experts) {
        this.experts = experts;
    }
}
