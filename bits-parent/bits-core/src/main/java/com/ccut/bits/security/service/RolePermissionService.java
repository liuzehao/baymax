/*
* RolePermissionService.java
* Created on  202015/2/17 12:40
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/17     panzhuowen    初始版本
*
*/

package com.ccut.bits.security.service;

import com.ccut.bits.model.Permission;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public interface RolePermissionService {

    void addRolePermission(int id,String permTokens);

    void delRolePermission(int id);

    List<Permission> findChoosedPermissionTokenByRoleId(int id);
}
