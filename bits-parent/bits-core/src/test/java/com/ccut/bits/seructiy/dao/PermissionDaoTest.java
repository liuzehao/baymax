/*
* PermissionDaoTest.java
* Created on  202015/2/5 20:02
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/2/5       panzhuo    初始版本
*
*/

package com.ccut.bits.seructiy.dao;

import com.ccut.bits.security.dao.PermissionDao;
import com.ccut.bits.model.Permission;
import com.ccut.bits.util.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@ContextConfiguration("/applicationContext-test.xml")
public class PermissionDaoTest extends SpringTransactionalTestCase {

    @Autowired
    private PermissionDao permissionDao;

    Permission getPermission() {
        Permission permission = new Permission();
        permission.setDescription("aa");
        permission.setPermToken("aaa");
        return permission;
    }

    @Test
    public void testAddPermission() {
        Permission permission = getPermission();
        Permission permission1 = new Permission();
        int i = 0;
        while (i < 32) {
            permissionDao.addPermission(permission);
            i++;
        }

        System.out.println(permissionDao.getPermissionListPage(permission1).size());
    }

}
