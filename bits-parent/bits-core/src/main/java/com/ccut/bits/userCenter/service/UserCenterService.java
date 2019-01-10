/*
* UserCenterService.java
* Created on  202015/5/24 17:17
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/5/24       longshihui    初始版本
*
*/

package com.ccut.bits.userCenter.service;

import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.model.User;
import com.ccut.bits.userCenter.model.General;
import com.ccut.bits.userCenter.model.History;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
public interface UserCenterService {
    List<Expert> getUserHistory(int userId);

    List<Expert> getUserRecommendExpert(int userId);

    void updatePassword(User user);

    void updateUserInfo(User user);

    List<History> getUserHistoryListPage(History history);

    List<General> getUserGeneralListPage(General general);

    void delUserHistory(int id);

    void delGeneral(int id);

    void setUserFocus(User user);

    void updateUserFocus(User user,String[] data,UserCenterServiceImpl.OPERATION O,UserCenterServiceImpl.PART P);

    Map<String,Object> getUserRecommend(User user);

    void updateUserFocusToDB(User user);

    void editUser(User user);
}
