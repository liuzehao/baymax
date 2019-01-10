/*
* literature.java
* Created on  2015-4-5 上午10:51
* 版本       修改时间          作者      修改内容
* V1.0.1    2015-4-5       weixuda    初始版本
*
*/
package com.ccut.bits.literature;

import com.ccut.bits.autocomplete.service.AutoCompleteService;

import com.ccut.bits.expert.service.ExpertService;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.literature.service.LiteratureService;
import com.ccut.bits.model.User;
import com.ccut.bits.page.Page;
import com.ccut.bits.page.PageResponse;
import com.ccut.bits.page.Pagination;
import com.ccut.bits.security.service.UserService;
import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.theme.service.ThemeService;
import com.ccut.bits.util.StringUtil;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.mahout.cf.taste.common.TasteException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */
@Controller
@RequestMapping("/literature")
public class LiteratureController {
    @Autowired
    UserService userService;
    @Autowired
    ThemeService theme;


    @Autowired
    private LiteratureService literatureService;
    @Autowired
    private ExpertService expertService;
    @Autowired
    private AutoCompleteService autoCompleteService;
    @RequestMapping("/getLiteratureListDo")
    @ResponseBody
    public PageResponse<Literature> getLiteratureListDo(Literature literature){
        return new PageResponse<>(literature.getPage(), literatureService.getLiteratureListPage(literature));
    }
    @RequestMapping("/getUserLiteratureListDo")
    @ResponseBody
    public PageResponse<Literature> getLiteratureListDo(Literature literature,HttpSession session){
        User user=(User)session.getAttribute("User");
        literature.getPage().setId(user.getUserId());
        List<Literature> lite= literatureService.getLiteratureListPage(literature);
        return new PageResponse<>(literature.getPage(), lite);
    }
    @RequestMapping("/getLiteratureList")
    public String getLiteratureList(HttpServletRequest request,Model model) {
        Page page = new Page(request);
        List<Literature> result = literatureService.getAllLiterature(page);
        Pagination pagination = new Pagination(page, literatureService.getTotalRecord(),null);
        return "literature/getLiteratureList";
    }

    @RequestMapping(value = "/setGeneralFile", method = {RequestMethod.POST})
    @ResponseBody
    public HashMap<String, String> setGeneralFile(HttpServletRequest request,HttpSession session) {
        User user = (User) session.getAttribute("User");
        String fileId=request.getParameter("fileId");
        int userId=user.getUserId();
        Date date=new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=format.format(date);
        literatureService.setGeneralFile(Integer.parseInt(fileId), userId, time);
        literatureService.setScore(Integer.parseInt(fileId), userId, 5);//收藏打5分
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("success", " ");
        return map;
    }

    @RequestMapping(value = "/setScore", method = {RequestMethod.POST})
    @ResponseBody
    public HashMap<String, String> setScore(HttpServletRequest request,HttpSession session) {
        User user = (User) session.getAttribute("User");
        String fileId=request.getParameter("fileId");
        String score=request.getParameter("score");
        int userId=user.getUserId();
        literatureService.setScore(Integer.parseInt(fileId), userId,Integer.parseInt(score));
        literatureService.setTotleScore(Integer.parseInt(fileId),Integer.parseInt(score));
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("success", " ");
        return map;
    }

    @RequestMapping("/getLiteratureDetail")
    public String getLiteratureDetail(@RequestParam("id")Integer id,Model model,HttpSession session)throws IOException, TasteException  {
        if (id == null) return "redirect:/literature/getLiteratureList";
        Literature literature;
        List<Literature> relations=literatureService.getRelationByFileId(id);
        User user = (User) session.getAttribute("User");
        List<RecommendedItem> recommend=null;
        if(user!=null) {
            recommend = literatureService.recommend(user.getUserId());
        }
        List<Literature> recommends =new LinkedList<>();
        if(recommend!=null) {
            for (RecommendedItem ritem : recommend) {
               Literature a =literatureService.getLiteratureById((int) ritem.getItemID());
                recommends.add(a);
            }
        }
        if(id>10000000) {
          literature = literatureService.getLiteratureById(id);
            int a=literature.getUserId();
            User uploadUser=userService.findUserById(a);
            List<Theme> themes=theme.getThemesByFileId(id);
            if(recommends!=null){  model.addAttribute("recommends",recommends);}
            model.addAttribute("Literature", literature);
            model.addAttribute("uploadUser", uploadUser);
            model.addAttribute("Themes", themes);
            model.addAttribute("relations",relations);
        }
        else{
            literature=literatureService.getLiteratureByIdOld(id);
        }
        if (literature == null) return "redirect:/literature/getLiteratureList";
       if(id<100000000) {
           String[] names = literature.getAuthorCn().split(";");
           names = StringUtil.trimStringArray(names);
           model.addAttribute("Literature",literature);
           model.addAttribute("Experts",expertService.getExpertByNames(names));
           return "literature/getLiteratureDetail";
       }
        return "literature/getNewLiteratureDetail";
    }



    @RequestMapping(value = "/getLiteratureByThemeId")
    public String getLiteratureByThemeId(HttpServletRequest request,Model model){
        Page page = new Page(request);
        int themeId = Integer.parseInt(request.getParameter("themeId"));
        List<Literature> result = literatureService.getLiteratureByThemeId(themeId, page);
        if (result == null || result.isEmpty()) return "redirect:/noRecord";
        int totalRecord = literatureService.getTotalRecordByThemeId(themeId);
        model.addAttribute("result",result);
        model.addAttribute("Pagination",new Pagination(page,totalRecord,"themeId="+themeId).getPagination());
        return "literature/getLiteratureList";
    }



    @RequestMapping(value = "addLiteratureDo", method = {RequestMethod.GET})
    public String addUserDo() {
        autoCompleteService.initAutoComplete();
        return "security/literature/addLiterature";
    }

    @RequestMapping(value = "editLiteratureDo", method = {RequestMethod.GET})
    public String editUserDo(HttpServletRequest request,@RequestParam("id") int id) {
        Literature literature = literatureService.getLiteratureById(id);
        literature.setThemeList(theme.getThemesByFileId(id));
        request.setAttribute("literature", literature);
        return "security/literature/editLiterature";
    }

    @RequestMapping(value = "addLiterature", method = RequestMethod.POST)
    @ResponseBody
    public void addLiterature(Literature literature){
        literatureService.addLiterature(literature);
    }



    @RequestMapping(value = "delLiteratureDo",method = {RequestMethod.DELETE})
    @ResponseBody
    public void delLiteratureDo(@RequestParam("id") int id) {
        literatureService.delLiterature(id);
    }

    @RequestMapping(value = "search",method = {RequestMethod.GET})
    public String search() {
        return "globalSearch/newGlobalSearch";
    }

}
