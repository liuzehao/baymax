/*
* RoleDao.java
* Created on  202015/2/8 19:21
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/8     panzhuowen    初始版本
*
*/

package com.ccut.bits.security.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.model.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@mybatisScan
public interface RoleDao {

    List<Role> getRoleListPage(Role role);

    void addRole(Role role);

    void delRole(@Param("id")int id);

    Role findRoleById(@Param("id")int id);

    void editRole(Role role);

    int checkRepeatRoleNameNum(@Param("roleName")String roleName);

    int checkRepeatRoleNameByRole(Role role);
}
