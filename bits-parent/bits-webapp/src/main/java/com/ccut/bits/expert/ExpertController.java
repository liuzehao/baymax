/*
* ExpertController.java
* Created on  2015-4-5 下午3:35
* 版本       修改时间          作者      修改内容
* V1.0.1    2015-4-5       weixuda    初始版本
*
*/
package com.ccut.bits.expert;

import com.ccut.bits.autocomplete.service.AutoCompleteService;
import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.expert.model.ExpertRank;
import com.ccut.bits.expert.service.ExpertService;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.literature.service.LiteratureService;
import com.ccut.bits.model.User;
import com.ccut.bits.page.Page;
import com.ccut.bits.page.PageResponse;
import com.ccut.bits.page.Pagination;
import com.ccut.bits.patent.model.Patent;
import com.ccut.bits.patent.service.PatentService;
import com.ccut.bits.relation.ExpertRelation;
import com.ccut.bits.relation.ThemeRelation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */
@Controller
@RequestMapping("/expert")
public class ExpertController {
    @Autowired
    private ExpertService expertService;
    @Autowired
    private LiteratureService literatureService;
    @Autowired
    private PatentService patentService;
    @Autowired
    private ThemeRelation themeRelation;
    @Autowired
    private ExpertRelation expertRelation;
    @Autowired
    private AutoCompleteService autoCompleteService;

    @RequestMapping("/getExpertList")
    public String getExpertList(HttpServletRequest request, Model model) {
        Page page = new Page(request);
        List<Expert> result = expertService.getAllExpert(page);
        Pagination pagination = new Pagination(page, expertService.getTotalRecord(), null);

        model.addAttribute("result", result);
        model.addAttribute("Pagination", pagination.getPagination());

        return "expert/getExpertList";
    }

    @RequestMapping("/getExpertDetail")
    public String getLiteratureDetail(@RequestParam("id") int expertId, Model model,HttpSession session) {
        Expert expert = expertService.getExpertById(expertId);
        List<Integer> literatureIds = new LinkedList<>();
        literatureIds.addAll(expertRelation.getLiteratureIds(expertId));
        List<Literature> literatures = literatureService.getLiteraturesByIds(literatureIds);
        List<Patent> patents = patentService.getPatentsByInventor(expert.getExpertName());
        User user = (User)session.getAttribute("User");
        if (user != null){
            model.addAttribute("isFocus",user.getFocusExperts().contains(Integer.valueOf(expertId)));
        }
        model.addAttribute("expert", expert);
        model.addAttribute("literatureList", literatures);
        model.addAttribute("patentList", patents);

        return "expert/getExpertDetail";
    }

    @RequestMapping("/getThemeExperts")
    public String getThemeExperts(@RequestParam("themeId") int themeId,HttpSession session, Model model) {
        List<ExpertRank> experts = expertService.getTopExpertRankByThemeId(themeId,expertService.getTotalExpertByThemeId(themeId));
        if (experts.isEmpty()) return "redirect:/noRecord";
        User user = (User)session.getAttribute("User");
        if (user != null){
            model.addAttribute("isFocus",user.getFocusThemes().contains(Integer.valueOf(themeId)));
        }
        model.addAttribute("currentTheme", themeRelation.getTheme(themeId));
        model.addAttribute("experts", experts);
        return "expert/getThemeExperts";
    }

    @RequestMapping(value = "/getExpertListDo", method = {RequestMethod.POST})
    @ResponseBody
    public PageResponse<Expert> getExpertListDo(Expert expert){
        return new PageResponse<>(expert.getPage(),expertService.getExpertListPage(expert));
    }

    @RequestMapping("/addExpertDo")
    public String addExpertDo(){
        autoCompleteService.initAutoComplete();
        return "security/expert/addExpertDo";
    }

    @RequestMapping("/addExpert")
    @ResponseBody
    public void addExpert(HttpServletRequest request){
        Expert expert = new Expert();
        expert.setExpertName(request.getParameter("expertName"));
        expert.setExpertOrg(request.getParameter("expertOrg"));
        String[] themeNames = request.getParameterValues("themeName[]");
        expertService.addExpert(expert,themeNames);
    }
    @RequestMapping("/editExpert")
    @ResponseBody
    public void editExpert(HttpServletRequest request){
        Expert expert = new Expert();
        expert.setId(Integer.parseInt(request.getParameter("id")));
        expert.setExpertName(request.getParameter("expertName"));
        expert.setExpertOrg(request.getParameter("expertOrg"));
        String[] themeName = request.getParameterValues("themeNames[]");
        expertService.editExpert(expert,themeName);
    }

    @RequestMapping(value = "/editExpertDo", method = {RequestMethod.GET})
    public String editExpertDo(HttpServletRequest request, @RequestParam("id") int id){
        Expert expert = expertService.getExpertById(id);
        request.setAttribute("expert", expert);
        return "security/expert/editExpertDo";
    }

    @RequestMapping(value = "/deleteExpert", method = {RequestMethod.DELETE})
    @ResponseBody
    public void deleteExpert(@RequestParam("id") int id){
        expertService.deleteExpert(id);
    }

}
