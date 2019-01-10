/*
* User.java
* Created on  202015/2/8 19:04
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/8     panzhuowen    初始版本
*
*/

package com.ccut.bits.model;

import com.ccut.bits.page.PageBase;

import java.util.Set;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public class User extends PageBase {
    private int userId;
    private String username;
    private String loginName;
    private String password;
    private String email;
    private boolean rememberMe;
    private Set<Integer> focusExperts;
    private Set<Integer> focusThemes;

    private int roleId;
    private String showRoleId;
    private String roleName;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public User() {

    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isRememberMe() {
        return rememberMe;
    }

    public void setRememberMe(boolean rememberMe) {
        this.rememberMe = rememberMe;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getShowRoleId() {
        return showRoleId;
    }

    public void setShowRoleId(String showRoleId) {
        this.showRoleId = showRoleId;
    }

    public Set<Integer> getFocusExperts() {
        return focusExperts;
    }

    public void setFocusExperts(Set<Integer> focusExperts) {
        this.focusExperts = focusExperts;
    }

    public Set<Integer> getFocusThemes() {
        return focusThemes;
    }

    public void setFocusThemes(Set<Integer> focusThemes) {
        this.focusThemes = focusThemes;
    }
}
