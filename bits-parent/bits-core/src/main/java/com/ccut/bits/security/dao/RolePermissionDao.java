/*
* RolePermissionDao.java
* Created on  202015/2/17 12:42
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/17     panzhuowen    初始版本
*
*/

package com.ccut.bits.security.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.model.Permission;
import com.ccut.bits.model.RolePermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@mybatisScan
public interface RolePermissionDao {

    void addRolePermission(RolePermission rolePermission);

    void delRolePermission(@Param("id")int id);

    List<Permission> findChoosedPermissionTokenByRoleId(@Param("id")int id);
}
