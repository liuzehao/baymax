/*
* ThemeController.java
* Created on  2015-4-9 上午11:49
* 版本       修改时间          作者      修改内容
* V1.0.1    2015-4-9       weixuda    初始版本
*
*/
package com.ccut.bits.theme;

import com.ccut.bits.constant.Constant;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.literature.service.LiteratureService;
import com.ccut.bits.relation.ThemeRelation;
import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.theme.model.ThemeTree;
import com.ccut.bits.theme.service.ThemeService;
import com.ccut.bits.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */
@Controller
@RequestMapping("/theme")
public class ThemeController {
    @Autowired
    private ThemeService themeService;
    @Autowired
    private LiteratureService literatureService;
    @RequestMapping("/getThemeList")
    public String getThemeList(Model model) {
        model.addAttribute("parentTheme",themeService.getThemeTree());
        model.addAttribute("TopTheme",themeService.getTopTheme());
        model.addAttribute("cacheThemes",themeService.getCacheThemeNames());
        return "theme/getNewThemeList";
    }

    @RequestMapping("/getThemeDetail")//点开大主题找小主题
    public String getThemeDetail(@RequestParam("id")Integer id,Model model){
        List<Integer> parentsId=new ArrayList<Integer>();
        parentsId.add(id);
        List<Integer>childIds=themeService.getChildIds(parentsId);
        HashMap<String,List<Literature>> littleTheme=new HashMap<String,List<Literature>>();
        for(int i=0;i<childIds.size();i++){
            int childId=childIds.get(i);
            String themeName=themeService.getThemeNameById(childId);//string
            List<Literature> files=literatureService.getLiteratureByThemeIdLimtNum(childId, 0, 10);// 前十个文件List<Literature>
            littleTheme.put(themeName,files);
        }
        Theme parentTheme=themeService.getParentThemeById(id);//得到大主题的名字和图片
        model.addAttribute("parentTheme",parentTheme);
        model.addAttribute("childrenTheme",littleTheme);
        model.addAttribute("childrenThemeId",childIds);
        return "theme/getThemeDetail";
    }
    @RequestMapping("/getThemeChartList")
    public String getThemeChartList(@RequestParam("id")Integer id,Model model){
        List<Integer> parentsId=new ArrayList<Integer>();
        parentsId.add(id);
        Theme parentTheme=themeService.getParentThemeById(id);
       String name= parentTheme.getThemeName();
        String str="[{\"href\":\"http://111.116.20.180/bits/theme/getThemeDetail?id="+id+"\",\"index\": 0,\"prop\": {\"name\":\""+name+"\"},\"x\": 560,\"y\": 480},";
      String str2="[";
        int totle=1;//节点总数
         List<Integer>childIds=themeService.getChildIds(parentsId);
        for(int i=0;i<childIds.size();i++){
            str2+="{\"source\":0,\"target\":"+totle+"},";
            int childId=childIds.get(i);
            String themeName=themeService.getThemeNameById(childId);//string
            str+="{\"href\":\"http://111.116.20.180/bits/theme/getFileDetail?id="+childId+"\",\"index\": 1,\"prop\":{\"name\":\""+themeName+""+"\" }},";
            List<Literature> files=literatureService.getLiteratureByThemeIdLimtNum(childId, 0, 3);// 前2个文件List<Literature>
            int themeTotle=totle;//节点号码
            for(int t=0;t<files.size();t++) {
                totle++;
                      str2+="{\"source\":"+themeTotle+",\"target\":"+totle+"},";
                Literature file=files.get(t);
                String fileName=file.getFileName();
                int fileId=file.getFileId();
                str+="{\"href\":\"http://111.116.20.180/bits/literature/getLiteratureDetail?id="+fileId+"\",\"index\": 2,\"prop\":{\"name\":\""+ fileName+"\" }},";
            }
            totle++;

        }
        str=str.substring(0,str.length()-1);
        str2=str2.substring(0,str2.length()-1);
        str2+="]";
        str+="]";
         model.addAttribute("a",str);
        model.addAttribute("r",str2);
        return "theme/getThemeChartList";

    }

    @RequestMapping("/getFileDetail")//点开小主题找文件
    public String getFileDetail(@RequestParam("id")Integer id,Model model,HttpServletRequest request){
       String url = request.getHeader("Referer");
        List<Literature> files=literatureService.getAllLiteratureByThemeId(id);
        String themeName=themeService.getThemeNameById(id);
        model.addAttribute("url",url);
        model.addAttribute("files",files);
        model.addAttribute("themeName",themeName);
        return "theme/getFileDetail";
    }

    @RequestMapping("/getChartData")
    @ResponseBody
    public Map<String,Integer> getChartData(){
        return themeService.getChartData();
    }

    @RequestMapping("/getDetailThemeChart")
    @ResponseBody
    public Map<String,Integer> getDetailThemeChart(@RequestParam("themeId")Integer themeId){
        return themeService.getDetailThemeChartData(themeId);
    }

    @RequestMapping(value = "/getThemeNames",method = RequestMethod.POST)
    @ResponseBody
    public List<String> getThemeNames(){
        return themeService.getThemeNames();
    }
}
