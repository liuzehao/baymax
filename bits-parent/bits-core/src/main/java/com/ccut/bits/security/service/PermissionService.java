/*
* PermissionService.java
* Created on  202015/2/8 19:22
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/8     panzhuowen    初始版本
*
*/

package com.ccut.bits.security.service;

import com.ccut.bits.model.MenuPerm;
import com.ccut.bits.model.Permission;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public interface PermissionService {

    List<Permission> getPermissionListPage(Permission permission);

    List<MenuPerm> getMenuTree();

    void delPermission(int id);

    void addPermission(Permission permission);

    Permission findPermissionById(int id);

    void editPermission(Permission permission);

    int checkRepeatPermToken(Permission permission);

    int checkRepeatPermissionName(Permission permission);

    int findPermissionIdByPermToken(String permToken);
}
