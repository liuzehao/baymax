/*
* UserCenterDao.java
* Created on  202015/5/24 17:09
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/5/24       longshihui    初始版本
*
*/

package com.ccut.bits.userCenter.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.model.User;
import com.ccut.bits.userCenter.model.General;
import com.ccut.bits.userCenter.model.History;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
@mybatisScan
public interface UserCenterDao {
    List<Integer> getUserHistoryExpertIds(@Param("userId")int userId);

    List<Integer> getUserRecommendExpertIds(@Param("userId")int userId);

    void updatePassword(User user);
    void editUser(User user);
    void updateUserInfo(User user);



    List<History> getUserHistoryListPage(History history);

    List<General> getUserGeneralListPage(General general);

    void delUserHistory(@Param("id")int id);

    void delGeneral(@Param("id")int id);

    void updateUserFocus(@Param("expertIds")String expertIds,@Param("themeIds")String themeIds,@Param("userId")int userId);

    String getUserFocusExperts(@Param("userId")int userId);

    String getUserFocusThemes(@Param("userId")int userId);
}
