/*
* PatentController.java
* Created on  2015-4-5 下午2:27
* 版本       修改时间          作者      修改内容
* V1.0.1    2015-4-5       weixuda    初始版本
*
*/
package com.ccut.bits.patent;

import com.ccut.bits.expert.service.ExpertService;
import com.ccut.bits.page.Page;
import com.ccut.bits.page.PageResponse;
import com.ccut.bits.patent.model.Patent;
import com.ccut.bits.patent.service.PatentService;
import com.ccut.bits.page.Pagination;
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
@RequestMapping("/patent")
public class PatentController {
    @Autowired
    private PatentService patentService;
    @Autowired
    private ExpertService expertService;

    @RequestMapping("/getPatentList")
    public String getPatentList(HttpServletRequest request, Model model) {
        Page page = new Page(request);
        List<Patent> result = patentService.getAllPatent(page);
        Pagination pagination = new Pagination(page, patentService.getTotalRecord(),null);

        model.addAttribute("result",result);
        model.addAttribute("Pagination",pagination.getPagination());

        return "patent/getPatentList";
    }

    @RequestMapping("/getPatentDetail")
    public String getPatentDetail(@RequestParam("id")Integer id,Model model) {
        if (id == null) return "redirect:/patent/getPatentList";
        Patent patent = patentService.getPatentById(id);
        if (patent == null) return "redirect:/noRecord";
        String[] names = patent.getInventor().split(",");
        model.addAttribute("Patent",patent);
        model.addAttribute("Experts",expertService.getExpertByNames(names));
        return "patent/getPatentDetail";
    }

    @RequestMapping("/addPatentInfo")
    public String addPatentInfo(){return  "security/patent/addPatentDo";}

    @RequestMapping("/getPatentListDo")
    @ResponseBody
    public PageResponse<Patent> getPatentListDo(Patent patent){
        return new PageResponse<>(patent.getPage(), patentService.getPatentListPage(patent));
    }

    @RequestMapping(value = "/addPatentInfoDo", method = {RequestMethod.POST})
    @ResponseBody
    public void addPatentInfoDo(Patent patent){
        patentService.addPatentInfo(patent);
    }


    @RequestMapping(value = "/deletePatentInfo", method = {RequestMethod.DELETE})
    @ResponseBody
    public void deletePatentInfo(@RequestParam("id")int id){
        patentService.deletePatentById(id);
    }

    @RequestMapping("/editPatentDo")
    public String editPatentInfo(HttpServletRequest request, @RequestParam("id") int id){
        Patent patent = patentService.getPatentById(id);
        request.setAttribute("patent", patent);
        return "security/patent/editPatentDo";
    }

    @RequestMapping("/editPatent")
    @ResponseBody
    public void editPatent(Patent patent){
        patentService.updatePatentById(patent);
    }

}
