/*
* MenuPerm.java
* Created on  202015/2/17 12:53
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/17     panzhuowen    初始版本
*
*/

package com.ccut.bits.model;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public class MenuPerm {
    private int id;
    private String permToken;
    private String menuName;
    private int parentId;
    private boolean checked=false;

    public MenuPerm() {
    }

    public MenuPerm(int id, String permToken, String menuName, int parentId) {
        this.id = id;
        this.permToken = permToken;
        this.menuName = menuName;
        this.parentId = parentId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPermToken() {
        return permToken;
    }

    public void setPermToken(String permToken) {
        this.permToken = permToken;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }
}
