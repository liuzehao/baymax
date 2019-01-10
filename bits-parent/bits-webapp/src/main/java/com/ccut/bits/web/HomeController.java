/*
* HomeController.java
* Created on  202015/2/6 16:49
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/2/6       panzhuo    初始版本
*
*/

package com.ccut.bits.web;

import com.ccut.bits.expert.service.ExpertService;
import com.ccut.bits.model.User;
import com.ccut.bits.theme.service.ThemeService;
import com.ccut.bits.userCenter.service.UserCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@Controller
@RequestMapping("/")
public class HomeController {
    @Autowired
    private ThemeService themeService;
    @Autowired
    private UserCenterService userCenterService;

    @RequestMapping(method = {RequestMethod.GET})
    public String index(HttpSession session,Model model) {
        User user = (User)session.getAttribute("User");
        if (user != null){
           // model.addAttribute("historyExpert", userCenterService.getUserHistory(user.getUserId()));
            model.addAttribute("recommendExpert",userCenterService.getUserRecommendExpert(user.getUserId()));
        }
        model.addAttribute("TopTheme",themeService.getTopTheme());
        return "indexN";
    }

    @RequestMapping(value = "admin/index", method = {RequestMethod.GET})
    public String adminIndex() {
        return "security/index";
    }

    @RequestMapping(value = "indexOld")
    public String index2(Model model){
        model.addAttribute("TopTheme",themeService.getTopTheme());
        return "indexOld";
    }

    @RequestMapping("/noRecord")
    public String getNoRecordPage(){
        return "error/noRecord";
    }
}
