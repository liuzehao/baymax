/*
* RolePermissionServiceImpl.java
* Created on  202015/2/17 12:41
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/17     panzhuowen    初始版本
*
*/

package com.ccut.bits.security.service.impl;

import com.ccut.bits.model.Permission;
import com.ccut.bits.model.RolePermission;
import com.ccut.bits.security.dao.PermissionDao;
import com.ccut.bits.security.dao.RolePermissionDao;
import com.ccut.bits.security.service.RolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@Service("rolePermissionService")
public class RolePermissionServiceImpl implements RolePermissionService {

    @Autowired
    private RolePermissionDao rolePermissionDao;

    @Autowired
    private PermissionDao permissionDao;

    @Override
    public void addRolePermission(int id, String permTokens) {
        RolePermission rolePermission = new RolePermission();
        rolePermission.setRoleId(id);
        String[] permToken = permTokens.split(",");
        for (String aPermToken : permToken) {
            int permId = permissionDao.findPermissionIdByPermToken(aPermToken);
            rolePermission.setPermId(permId);
            rolePermission.setPermToken(aPermToken);
            rolePermissionDao.addRolePermission(rolePermission);
        }
    }

    @Override
    public void delRolePermission(int id) {
        rolePermissionDao.delRolePermission(id);
    }

    @Override
    public List<Permission> findChoosedPermissionTokenByRoleId(int id) {
        return rolePermissionDao.findChoosedPermissionTokenByRoleId(id);
    }
}
