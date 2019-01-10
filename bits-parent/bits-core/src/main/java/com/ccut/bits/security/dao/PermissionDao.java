/*
* PermissionDao.java
* Created on  202015/2/5 19:50
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/2/5       panzhuowen    初始版本
*
*/

package com.ccut.bits.security.dao;

import com.ccut.bits.model.Permission;
import com.ccut.bits.annotation.mybatisScan;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@mybatisScan
public interface PermissionDao {

    void addPermission(Permission permission);

    List<Permission> getPermissionListPage(Permission permission);

    void delPermission(@Param("id")int id);

    Permission findPermissionById(@Param("id")int id);

    void editPermission(Permission permission);

    int checkRepeatPermToken(Permission permission);

    int checkRepeatPermissionName(Permission permission);

    int findPermissionIdByPermToken(@Param("permToken")String permToken);
}
