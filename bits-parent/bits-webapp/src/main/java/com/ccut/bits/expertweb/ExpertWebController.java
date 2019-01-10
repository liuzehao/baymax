/*
* ExpertWebController.java
* Created on  2015-4-6 下午7:51
* 版本       修改时间          作者      修改内容
* V1.0.1    2015-4-6       weixuda    初始版本
*
*/
package com.ccut.bits.expertweb;

import com.ccut.bits.autocomplete.service.AutoCompleteService;
import com.ccut.bits.relation.ThemeRelation;
import com.ccut.bits.theme.service.ThemeService;
import com.ccut.bits.themeWeb.model.PeopleRank;
import com.ccut.bits.themeWeb.model.ThemeWeb;
import com.ccut.bits.themeWeb.service.ThemeWebService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */
@Controller
@RequestMapping("/expertWeb")
public class ExpertWebController {

    @Autowired
    private ThemeWebService themeWebService;
    @Autowired
    private ThemeService themeService;
    @Autowired
    private ThemeRelation themeRelation;

    @Autowired
    private AutoCompleteService autoCompleteService;

    @RequestMapping("/getExpertWeb")
    public String getExpertWeb() {
        autoCompleteService.initAutoComplete();
        return "expertWeb/getExpertWeb";
    }

    @RequestMapping("/getExpertWebDetail")
    public String getExpertWebDetail() {
        return "expertWeb/getExpertWebDetail";
    }

    @RequestMapping("/getExpertWebMap")
    public String getExpertWebMap(HttpServletRequest request, @RequestParam("themeName") String themeName) {
        int id = themeWebService.getThemeId(themeName);
        request.setAttribute("themeId", id);
        return "expertWeb/getExpertWebMap";
    }

    @RequestMapping(value = "/getThemeWeb", method = RequestMethod.POST)
    public String getThemeWeb(@RequestParam("themeName")String themeName, HttpServletRequest request,Model model) {
        int themeId = themeRelation.getThemeId(themeName);
//        request.setAttribute("themeId", themeId);
        model.addAttribute("themeId",themeId);
        return "expertWeb/getThemeWeb";
    }

    @RequestMapping("/getPeopleRank")
    @ResponseBody
    public List<PeopleRank> getPeopleRank(@RequestParam("id") int id) {
        return themeWebService.getPeopleRank(id);
    }

    @RequestMapping("/getThemeRelationship")
    @ResponseBody
    public List<ThemeWeb> getThemeRelationShip(@RequestParam("id") int id) {
        return themeWebService.getThemeWeb(id);
    }

}
