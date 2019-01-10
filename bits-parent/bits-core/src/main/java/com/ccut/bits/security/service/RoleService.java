/*
* RoleService.java
* Created on  202015/2/8 19:19
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/8     panzhuowen    初始版本
*
*/

package com.ccut.bits.security.service;

import com.ccut.bits.model.MenuPerm;
import com.ccut.bits.model.Permission;
import com.ccut.bits.model.Role;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public interface RoleService {

    List<Role> getRoleListPage(Role role);

    void addRole(Role role);

    void delRole(int id);

    Role findRoleById(int id);

    String getPermissionTokenValues(List<Permission> choosedPerms);

    String getPermissionTokens(List<Permission> choosedPerms);

    void setHasChecked(List<MenuPerm> menuPermList, List<Permission> choosedPerms);

    void editRole(Role role);

    int checkRepeatRoleNameNum(String roleName);

    int checkRepeatRoleNameByRole(Role role);
}
