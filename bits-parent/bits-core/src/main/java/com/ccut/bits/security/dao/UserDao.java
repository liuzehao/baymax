/*
* UserDao.java
* Created on  202015/2/8 19:11
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/8     panzhuowen    初始版本
*
*/

package com.ccut.bits.security.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@mybatisScan
public interface UserDao {

    User findUserByLoginName(@Param("userName") String userName);

    List<String> getRolesByLoginName(@Param("username") String username);

    List<String> getPermTokensByLoginName(@Param("username") String username);

    List<User> getUserListPage(User user);

    void addUserDo(User user);

    void addUserRole(User user);

    void delUser(@Param("id") int id);

    void delUserRole(@Param("id") int id);

    User findUserById(@Param("id") int id);

    void editUser(User user);

    void editUserRole(User user);

    int hasCheckRepeatLoginName(@Param("loginName") String loginName);

    int checkRepeatUser(User user);

    void addUserHistory(@Param("userId") int userId, @Param("fileId")int fileId,@Param("time") String time);

}
