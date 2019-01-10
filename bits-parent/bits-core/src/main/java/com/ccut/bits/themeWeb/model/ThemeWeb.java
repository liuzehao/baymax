package com.ccut.bits.themeWeb.model;

import com.ccut.bits.page.PageBase;


public class ThemeWeb extends PageBase {

    private int themeId;
    private int idFirst;
    private int idSecond;

    public int getThemeId() {
        return themeId;
    }

    public void setThemeId(int themeId) {
        this.themeId = themeId;
    }

    public int getIdFirst() {
        return idFirst;
    }

    public void setIdFirst(int idFirst) {
        this.idFirst = idFirst;
    }

    public int getIdSecond() {
        return idSecond;
    }

    public void setIdSecond(int idSecond) {
        this.idSecond = idSecond;
    }
}
