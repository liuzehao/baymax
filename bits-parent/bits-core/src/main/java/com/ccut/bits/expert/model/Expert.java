package com.ccut.bits.expert.model;

import com.ccut.bits.page.PageBase;
import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.util.StringUtil;

import java.util.List;

/**
 * Created by Demon on 2015/4/14.
 */
public class Expert extends PageBase{
    private int id;
    private String expertName;
    private String expertOrg;
    private String img;
    private List<Theme> themeList;

    public String getExpertName(){
        return expertName;
    }

    public void setExpertName(String expertName){
        this.expertName = expertName;
    }

    public String getExpertOrg(){
        return expertOrg;
    }

    public void setExpertOrg(String expertOrg){
        this.expertOrg = expertOrg;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public List<Theme> getThemeList() {
        return themeList;
    }

    public void setThemeList(List<Theme> themeList) {
        this.themeList = themeList;
    }
}
