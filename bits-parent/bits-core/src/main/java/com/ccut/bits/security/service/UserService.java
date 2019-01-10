/*
* UserService.java
* Created on  202015/2/8 19:04
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/8     panzhuowen    初始版本
*
*/

package com.ccut.bits.security.service;

import com.ccut.bits.model.User;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public interface UserService {

    User findUserByLoginName(String userName);

    List<String> getRolesByLoginName(String username);

    List<String> getPermTokensByLoginName(String username);

    List<User> getUserListPage(User user);

    void addUserDo(User user);

    void delUser(int id);

    User findUserById(int id);

    void editUser(User user);

    void editUserRole(User user);

    int hasCheckRepeatLoginName(String loginName);

    int checkRepeatUser(User user);

    void addUserHistory(int userId, int fileId,String time);
}
