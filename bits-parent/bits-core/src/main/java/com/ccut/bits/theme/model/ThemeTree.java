package com.ccut.bits.theme.model;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Demon on 2015/4/14.
 */
public class ThemeTree extends Theme {
    private int parentId;
    private List<ThemeTree> childThemeTree;

    public ThemeTree(){
        this.childThemeTree = new LinkedList<ThemeTree>();
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public List<ThemeTree> getChildThemeTree() {
        return childThemeTree;
    }

    public void setChildThemeTree(List<ThemeTree> childThemeTree) {
        this.childThemeTree = childThemeTree;
    }
}
