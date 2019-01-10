/*
* RoleServiceImpl.java
* Created on  202015/2/8 19:20
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/8     panzhuowen    初始版本
*
*/

package com.ccut.bits.security.service.impl;

import com.ccut.bits.model.MenuPerm;
import com.ccut.bits.model.Permission;
import com.ccut.bits.model.Role;
import com.ccut.bits.security.dao.RoleDao;
import com.ccut.bits.security.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@Transactional
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public List<Role> getRoleListPage(Role role) {
        return roleDao.getRoleListPage(role);
    }

    @Override
    public void addRole(Role role) {
        roleDao.addRole(role);
    }

    @Override
    public void delRole(int id) {
        roleDao.delRole(id);
    }

    @Override
    public Role findRoleById(int id) {
        return roleDao.findRoleById(id);
    }

    @Override
    public String getPermissionTokenValues(List<Permission> permissionList) {
        String permissionValues = "";
        if (!permissionList.isEmpty()) {
            for (Permission permission : permissionList) {
                permissionValues += permission.getDescription() + ",";
            }
        }
        permissionValues = permissionValues.substring(0, permissionValues.length() - 1);
        return permissionValues;
    }

    @Override
    public String getPermissionTokens(List<Permission> permissionList) {
        String permissionTokens = "";
        if (!permissionList.isEmpty()) {
            for (Permission permission : permissionList) {
                permissionTokens += permission.getPermToken() + ",";
            }
        }
        permissionTokens = permissionTokens.substring(0, permissionTokens.length() - 1);
        return permissionTokens;
    }

    @Override
    public void setHasChecked(List<MenuPerm> menuPermList, List<Permission> permissionList) {
        for (MenuPerm menuPerm : menuPermList) {
            for (Permission permissionSelect : permissionList) {
                if (permissionSelect.getPermToken().equals(menuPerm.getPermToken())) {
                    menuPerm.setChecked(true);
                }
            }
        }
    }

    @Override
    public void editRole(Role role) {
        roleDao.editRole(role);
    }

    @Override
    public int checkRepeatRoleNameNum(String roleName) {
        return roleDao.checkRepeatRoleNameNum(roleName);
    }

    @Override
    public int checkRepeatRoleNameByRole(Role role) {
        return roleDao.checkRepeatRoleNameByRole(role);
    }

}
