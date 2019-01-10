/*
* PermissionServiceImpl.java
* Created on  202015/2/8 19:22
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/8     panzhuowen    初始版本
*
*/

package com.ccut.bits.security.service.impl;

import com.ccut.bits.model.MenuPerm;
import com.ccut.bits.model.Permission;
import com.ccut.bits.security.dao.PermissionDao;
import com.ccut.bits.security.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@Transactional
@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionDao permissionDao;

    @Override
    public List<MenuPerm> getMenuTree() {
        List<MenuPerm> menuPermList = new ArrayList<>();
        menuPermList.add(new MenuPerm(1,"","权限选择",-1));
        menuPermList.add(new MenuPerm(2,"admin","系统设置",1));
        menuPermList.add(new MenuPerm(3,"user_admin","用户管理",2));
        menuPermList.add(new MenuPerm(3,"role_admin","角色管理",2));
        menuPermList.add(new MenuPerm(3,"perm_admin","权限管理",2));
        return menuPermList;
    }

    @Override
    public List<Permission> getPermissionListPage(Permission permission) {
        return permissionDao.getPermissionListPage(permission);
    }

    @Override
    public void delPermission(int id) {
        permissionDao.delPermission(id);
    }

    @Override
    public void addPermission(Permission permission) {
        permissionDao.addPermission(permission);
    }

    @Override
    public Permission findPermissionById(int id) {
        return permissionDao.findPermissionById(id);
    }

    @Override
    public void editPermission(Permission permission) {
        permissionDao.editPermission(permission);
    }

    @Override
    public int checkRepeatPermToken(Permission permission) {
        return permissionDao.checkRepeatPermToken(permission);
    }

    @Override
    public int checkRepeatPermissionName(Permission permission) {
        return permissionDao.checkRepeatPermissionName(permission);
    }

    @Override
    public int findPermissionIdByPermToken(String permToken) {
        return permissionDao.findPermissionIdByPermToken(permToken);
    }
}
