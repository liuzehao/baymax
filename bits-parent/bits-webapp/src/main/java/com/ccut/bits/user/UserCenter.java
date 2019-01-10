/*
* UserCenter.java
* Created on  2015-4-20 上午10:08
* 版本       修改时间          作者      修改内容
* V1.0.1    2015-4-20       weixuda    初始版本
*
*/
package com.ccut.bits.user;

import com.ccut.bits.expert.service.ExpertService;
import com.ccut.bits.model.User;
import com.ccut.bits.page.Page;
import com.ccut.bits.page.PageResponse;
import com.ccut.bits.relation.ExpertRelation;
import com.ccut.bits.relation.ThemeRelation;
import com.ccut.bits.security.service.UserService;
import com.ccut.bits.userCenter.model.General;
import com.ccut.bits.userCenter.model.History;
import com.ccut.bits.userCenter.service.UserCenterService;
import com.ccut.bits.userCenter.service.UserCenterServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */

@Controller
@RequestMapping("/userCenter")
public class UserCenter {
    @Autowired
    private UserService userService;
    @Autowired
    private UserCenterService userCenterService;
    @Autowired
    private ThemeRelation themeRelation;
    @Autowired
    private ExpertService expertService;
    private int currentUserId = 0;

    private boolean maybeRedirect(HttpSession session) {
        return session.getAttribute("User") == null;
    }

    private User getCurrentUser(HttpSession session) {
        return (User) session.getAttribute("User");
    }

    private boolean isChangeUser(HttpSession session) {
        User user = (User) session.getAttribute("User");
        return currentUserId != user.getUserId();
    }
    //修改个人资料
    @RequestMapping(value = "/editUser", method = {RequestMethod.POST})
    @ResponseBody
    public void editUser(User user) {
        userCenterService.editUser(user);
    }

    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    @ResponseBody
    public void updatePassword(User user) {
        userCenterService.updatePassword(user);
    }

    @RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public void updateUserInfo(User user) {
        userCenterService.updateUserInfo(user);
    }

    @RequestMapping(value = "getUserHistory", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<History> getUserHistoryListPage(History history) {
        return new PageResponse<>(history.getPage(), userCenterService.getUserHistoryListPage(history));
    }

    @RequestMapping(value = "getUserGeneral", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<General> getUserGeneralListPage(General general) {
        return new PageResponse<>(general.getPage(), userCenterService.getUserGeneralListPage(general));
    }


    @RequestMapping(value = "delUserHistory", method = {RequestMethod.GET})
    @ResponseBody
    public void delUserHistory(@RequestParam("id") int id) {
        userCenterService.delUserHistory(id);
    }
//常用文件删除
    @RequestMapping(value = "delGeneralDo", method = {RequestMethod.GET})//删除
    @ResponseBody
    public void deleteGeneralDo(@RequestParam("id") int id) {
     userCenterService.delGeneral(id);
    }
    //用户关注部分
    @RequestMapping(value = "addUserFocusThemes", method = RequestMethod.POST)
    @ResponseBody
    public void addUserFocusThemes(HttpServletRequest request, HttpSession session) {
        String[] expertIds = request.getParameterValues("themeIds[]");
        User user = (User) session.getAttribute("User");
        if (user == null)
            return;
        userCenterService.updateUserFocus(user, expertIds, UserCenterServiceImpl.OPERATION.ADD, UserCenterServiceImpl.PART.FOCUS_THEME);
    }

    @RequestMapping(value = "addUserFocusExperts", method = RequestMethod.POST)
    @ResponseBody
    public void addUserFocusExperts(HttpServletRequest request, HttpSession session) {
        String[] expertIds = request.getParameterValues("expertIds[]");
        User user = (User) session.getAttribute("User");
        if (user == null)
            return;
        userCenterService.updateUserFocus(user, expertIds, UserCenterServiceImpl.OPERATION.ADD, UserCenterServiceImpl.PART.FOCUS_EXPERT);
    }

    @RequestMapping(value = "delUserFocusThemes", method = RequestMethod.POST)
    @ResponseBody
    public void delUserFocusThemes(HttpServletRequest request, HttpSession session) {
        String[] expertIds = request.getParameterValues("themeIds[]");
        User user = (User) session.getAttribute("User");
        if (user == null)
            return;
        userCenterService.updateUserFocus(user, expertIds, UserCenterServiceImpl.OPERATION.DEL, UserCenterServiceImpl.PART.FOCUS_THEME);
    }

    @RequestMapping(value = "delUserFocusExperts", method = RequestMethod.POST)
    @ResponseBody
    public void delUserFocusExperts(HttpServletRequest request, HttpSession session) {
        String[] expertIds = request.getParameterValues("expertIds[]");
        User user = (User) session.getAttribute("User");
        if (user == null)
            return;
        userCenterService.updateUserFocus(user, expertIds, UserCenterServiceImpl.OPERATION.DEL, UserCenterServiceImpl.PART.FOCUS_EXPERT);
    }

    @RequestMapping(value = "updateUserFocus", method = RequestMethod.POST)
    @ResponseBody
    public void updateUserFocus(HttpServletRequest request, HttpSession session) {
        User user = this.getCurrentUser(session);
        if (user == null)
            return;
        String[] themeIds = request.getParameterValues("themeIds[]");
        String[] expertIds = request.getParameterValues("expertIds[]");
        if (themeIds != null) {
            Integer[] t1 = new Integer[themeIds.length];
            for (int i = 0; i < themeIds.length; i++) {
                t1[i] = Integer.valueOf(themeIds[i]);
            }
            user.getFocusThemes().clear();
            user.getFocusThemes().addAll(Arrays.asList(t1));
        }else{
            user.getFocusThemes().clear();
        }
        if (expertIds != null) {
            Integer[] t2 = new Integer[expertIds.length];

            for (int i = 0; i < expertIds.length; i++) {
                t2[i] = Integer.valueOf(expertIds[i]);
            }
            user.getFocusExperts().clear();
            user.getFocusExperts().addAll(Arrays.asList(t2));
        }else{
            user.getFocusExperts().clear();
        }
        userCenterService.updateUserFocusToDB(user);
    }

    @RequestMapping(value = "getUserFocusThemes", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserFocus(HttpSession session) {
        User user = this.getCurrentUser(session);
        Map<String, Object> map = new HashMap<>();
        map.put("focusThemes", themeRelation.getThemes(user.getFocusThemes()));
        return map;
    }

    //以下为页面跳转
    @RequestMapping("/handleUserInfo")
    public String getUserCenterPage(Model model, HttpSession session) {
        if (maybeRedirect(session))
            return "redirect:/login";
        User user = this.getCurrentUser(session);
        User user1=userService.findUserByLoginName(user.getLoginName());
        model.addAttribute("User",user1);
//        model.addAttribute("focusThemes", themeRelation.getThemes(user.getFocusThemes()));
  //      model.addAttribute("focusExpert", expertService.getExpertsByIds(user.getFocusExperts()));
        return "user/handleUserInfo";
    }

    @RequestMapping("/handlePassword")
    public String changePassword(HttpSession session) {
        if (maybeRedirect(session))
            return "redirect:/login";
        return "user/handlePassword";
    }

    @RequestMapping("/handleHistory")
    public String searchHistory(HttpSession session) {
        if (maybeRedirect(session))
            return "redirect:/login";
        return "user/handleHistory";
    }
    @RequestMapping("/handleGeneral")
    public String GeneralFile(HttpSession session) {
        if (maybeRedirect(session))
            return "redirect:/login";
        return "user/generalFile";
    }
    @RequestMapping("/handleFocus")
    public String focusThemeList(HttpSession session, Model model) {
        if (maybeRedirect(session))
            return "redirect:/login";
        model.addAttribute("cacheThemes", themeRelation.getCacheThemes());
        model.addAttribute("focusExpert", expertService.getExpertsByIds(getCurrentUser(session).getFocusExperts()));
        if (isChangeUser(session)) {
            session.setAttribute("recommendInfo", userCenterService.getUserRecommend(this.getCurrentUser(session)));
            this.currentUserId = getCurrentUser(session).getUserId();
        }else{
            if(session.getAttribute("recommendInfo") == null)
                session.setAttribute("recommendInfo", userCenterService.getUserRecommend(this.getCurrentUser(session)));
        }
        return "user/handleFocus";
    }
    @RequestMapping("/handleUpload")
    public String handleUpload(HttpSession session) {
        if (maybeRedirect(session))
            return "redirect:/login";
        return "user/handleUpload";
    }
    @RequestMapping("/uploadFile")
    public String uploadFile() {
        return "file/upload";
    }
    @RequestMapping("/interestRecommend")
    public String interestRecommend() {
        return "user/interestRecommend";
    }



}
