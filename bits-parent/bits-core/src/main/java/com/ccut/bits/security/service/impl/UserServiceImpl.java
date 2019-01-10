/*
* UserServiceImpl.java
* Created on  202015/2/8 19:12
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/8     panzhuowen    初始版本
*
*/

package com.ccut.bits.security.service.impl;

import com.ccut.bits.model.User;
import com.ccut.bits.security.dao.UserDao;
import com.ccut.bits.security.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@Transactional
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User findUserByLoginName(String userName) {
        return userDao.findUserByLoginName(userName);
    }

    @Override
    public List<String> getRolesByLoginName(String username) {
        return userDao.getRolesByLoginName(username);
    }

    @Override
    public List<String> getPermTokensByLoginName(String username) {
        return userDao.getPermTokensByLoginName(username);
    }

    @Override
    public List<User> getUserListPage(User user) {
        return userDao.getUserListPage(user);
    }

    @Override
    public void addUserDo(User user) {
        userDao.addUserDo(user);
        userDao.addUserRole(user);
    }

    @Override
    public void delUser(int id) {
        userDao.delUser(id);
        userDao.delUserRole(id);
    }

    @Override
    public User findUserById(int id) {
        return userDao.findUserById(id);
    }

    @Override
    public void editUser(User user) {
        userDao.editUser(user);
    }

    @Override
    public void editUserRole(User user) {
        userDao.editUserRole(user);
    }

    @Override
    public int hasCheckRepeatLoginName(String loginName) {
        return userDao.hasCheckRepeatLoginName(loginName);
    }

    @Override
    public int checkRepeatUser(User user) {
        return userDao.checkRepeatUser(user);
    }

    @Override
    public void addUserHistory(int userId, int fileId,String time) {
        userDao.addUserHistory(userId, fileId,time);
    }

//    @Override
//    public List<String> getRolesByLoginName(String loginName) {
//        return roleDao.findAllRoleNamesByLoginName(loginName);
//    }

//    @Override
//    public List<String> getPermTokensByLoginName(String loginName) {
//        List<String> rolePermTokens = roleDao.findAllRolePermTokensByLoginName(loginName);
//        Map<String, String> map = new HashMap<>();
//        for (String permToken : rolePermTokens) {
//            map.put(permToken, permToken);
//        }
//        List<String> userPermTokensList = userDao.findAllUserPermTokensByUserId(loginName);
//        for (String permToken : userPermTokensList) {
//            map.put(permToken, permToken);
//        }
//        return new ArrayList<>(map.keySet());
//    }
}
