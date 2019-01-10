/*
* LoginUtil.java
* Created on  202015/2/9 14:53
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/9     panzhuowen    初始版本
*
*/

package com.ccut.bits.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public class LoginUtil {

    public LoginUtil() {
    }

    public static String getLoginName() {
        Subject currentUser = SecurityUtils.getSubject();
        return (String) currentUser.getPrincipal();
    }

}
