/*
* UserCenterServiceImpl.java
* Created on  202015/5/24 17:18
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/5/24       longshihui    初始版本
*
*/

package com.ccut.bits.userCenter.service;

import com.ccut.bits.expert.dao.ExpertDao;
import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.model.User;
import com.ccut.bits.relation.ExpertRelation;
import com.ccut.bits.relation.ThemeRelation;
import com.ccut.bits.theme.dao.ThemeDao;
import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.theme.service.ThemeService;
import com.ccut.bits.userCenter.dao.UserCenterDao;
import com.ccut.bits.userCenter.model.General;
import com.ccut.bits.userCenter.model.History;
import com.ccut.bits.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
@Service
public class UserCenterServiceImpl implements UserCenterService {
    @Autowired
    private ExpertDao expertDao;
    @Autowired
    private UserCenterDao userCenterDao;
    @Autowired
    private ThemeDao themeDao;
    @Autowired
    private ThemeRelation themeRelation;
    @Autowired
    private ExpertRelation expertRelation;
    private static int RECOMMEND_NUM = 8;

    public static enum OPERATION {
        DEL,
        ADD
    }

    public static enum PART {
        FOCUS_THEME,
        FOCUS_EXPERT
    }

    @Override
    public List<Expert> getUserHistory(int userId) {
        List<Integer> expertIds = userCenterDao.getUserHistoryExpertIds(userId);
        if (expertIds.isEmpty()) return new LinkedList<>();
        List<Expert> experts = expertDao.getExpertsByIds(expertIds);
        for (Expert expert : experts) {
            expert.setThemeList(themeDao.getThemesByExpertId(expert.getId()));
        }
        return experts;
    }

    @Override
    public List<Expert> getUserRecommendExpert(int userId) {
        List<Integer> expertIds = userCenterDao.getUserRecommendExpertIds(userId);
        if (expertIds.isEmpty()) return new LinkedList<>();
        List<Expert> experts = expertDao.getExpertsByIds(expertIds);
        for (Expert expert : experts) {
            expert.setThemeList(themeDao.getThemesByExpertId(expert.getId()));
        }
        return experts;
    }

    @Override
    public void updatePassword(User user) {
        userCenterDao.updatePassword(user);
    }

    @Override
    public void editUser(User user) {
        userCenterDao.editUser(user);
    }

    @Override
    public void updateUserInfo(User user) {
        userCenterDao.updateUserInfo(user);
    }

    @Override
    public List<History> getUserHistoryListPage(History history) {
        List<History> histories = userCenterDao.getUserHistoryListPage(history);
        return histories;
    }
    @Override
    public List<General> getUserGeneralListPage(General general){
        List<General> generals=userCenterDao.getUserGeneralListPage(general);
        return generals;
    }

    @Override
    public void delUserHistory(int id) {
        userCenterDao.delUserHistory(id);
    }
    @Override
    public void delGeneral(int id){userCenterDao.delGeneral(id);}
    @Override
    public void setUserFocus(User user) {
        user.setFocusExperts(this.getUserFocusExperts(user.getUserId()));
        user.setFocusThemes(this.getUserFocusThemes(user.getUserId()));
    }

    @Override
    public void updateUserFocus(User user, String[] d, OPERATION O, PART P) {
        Integer[] data = new Integer[d.length];
        for (int i = 0; i < d.length; i++) {
            data[i] = Integer.valueOf(d[i]);
        }
        switch (O) {
            case ADD:
                if (P == PART.FOCUS_EXPERT) {
                    user.getFocusExperts().addAll(Arrays.asList(data));
                    break;
                }
                if (P == PART.FOCUS_THEME)
                    user.getFocusThemes().addAll(Arrays.asList(data));
                break;
            case DEL:
                if (P == PART.FOCUS_EXPERT) {
                    user.getFocusExperts().removeAll(Arrays.asList(data));
                    break;
                }
                if (P == PART.FOCUS_THEME)
                    user.getFocusThemes().removeAll(Arrays.asList(data));
                break;
        }
        this.updateUserFocusToDB(user);
    }

    //用户推荐
    @Override
    public Map<String, Object> getUserRecommend(User user) {
        //数据准备
        List<Integer> historyExpertIds = userCenterDao.getUserHistoryExpertIds(user.getUserId());
        Set<Integer> focusExpertIds = user.getFocusExperts();
        Set<Integer> focusThemeIds = user.getFocusThemes();
        Set<Integer> finalThemeIds = new HashSet<>();
        Map<String, Object> result = new HashMap<>();
        //合并相关专家id
        Set<Integer> temp = new HashSet<>();
        temp.addAll(historyExpertIds);
        temp.addAll(focusExpertIds);
        //合并主题id
        finalThemeIds.addAll(focusThemeIds);
        for (Integer t : temp) {
            finalThemeIds.addAll(expertRelation.getThemeIds(t));
        }
        //如果没有任何涉及主题，则取消推荐
        if (finalThemeIds.size() == 0)
            return new HashMap<>();
        List<Integer> parent = themeDao.getParentIds(new LinkedList<>(finalThemeIds));
        //大主题下的所有子主题
        List<Integer> child = themeDao.getChildIds(parent);
        //原有已关注主题、关注专家涉及主题去重
        child.removeAll(finalThemeIds);
        //判断涉及主题数目是否大于推荐数目
        if (child.size() > RECOMMEND_NUM) {
            //获取其中的热门主题
            child = themeDao.getTopThemeIdsByIds(child, RECOMMEND_NUM);
        }
        //推荐主题数据装配
        result.put("recommendTheme", themeRelation.getThemes(child));
        //推荐专家
        Set<Integer> recommendExpertIds = new HashSet<>();
        for (Integer i : child) {
            recommendExpertIds.addAll(themeRelation.getExpertIds(i));
        }
        if (recommendExpertIds.size() > RECOMMEND_NUM) {
            //评分
            List<Integer> topExpertIds = expertDao.getTopExpert(recommendExpertIds);
            recommendExpertIds.clear();
            recommendExpertIds.addAll(topExpertIds.subList(0, RECOMMEND_NUM));
        }
        result.put("recommendExpert", expertDao.getExpertsByIds(recommendExpertIds));
        return result;
    }

    private Set<Integer> getUserFocusExperts(int userId) {
        String ids = userCenterDao.getUserFocusExperts(userId);
        Set<Integer> re = new HashSet<>();
        if (StringUtil.notEmpty(ids)) {
            for (String id : ids.split(",")) {
                re.add(Integer.valueOf(id.trim()));
            }
        }
        return re;
    }

    private Set<Integer> getUserFocusThemes(int userId) {
        String ids = userCenterDao.getUserFocusThemes(userId);
        Set<Integer> re = new HashSet<>();
        if (StringUtil.notEmpty(ids)) {
            for (String id : ids.split(",")) {
                re.add(Integer.valueOf(id.trim()));
            }
        }
        return re;
    }

    @Override
    public void updateUserFocusToDB(User user) {
        Set<Integer> expertIds = user.getFocusExperts();
        Set<Integer> themeIds = user.getFocusThemes();
        String ex = expertIds.toString();
        String th = themeIds.toString();
        String finalEx = expertIds.isEmpty() ? "" : ex.substring(1, ex.length() - 1);
        String finalTh = themeIds.isEmpty() ? "" : th.substring(1, th.length() - 1);
        userCenterDao.updateUserFocus(finalEx, finalTh, user.getUserId());
    }

}
