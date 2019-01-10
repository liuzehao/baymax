package com.ccut.bits.file;

import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.literature.service.LiteratureService;
import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.theme.service.ThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ccut.bits.page.PageResponse;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * Created by hao pc on 2016/4/20.
 */
@Controller
@RequestMapping("/file")
public class FileController {
    @Autowired
    private ThemeService theme;
    @Autowired
    private LiteratureService literatureService;
    @RequestMapping(value = "editFileDo", method = {RequestMethod.GET})//发布前的编辑调用页面
    public String editFileDo(HttpServletRequest request,@RequestParam("id") int id) {
        Literature literature = literatureService.getLiteratureById(id);
        request.setAttribute("literature", literature);
        return "file/editFile";
    }
    @RequestMapping(value = "editFileDoT", method = {RequestMethod.GET})//发布后的编辑调用页面
    public String editFileDoT(HttpServletRequest request,@RequestParam("id") int id) {
        Literature literature = literatureService.getLiteratureById(id);
        List<Theme> themes=theme.getThemesByFileId(id);
       literature.setThemeList(themes);
        request.setAttribute("literature", literature);
        return "file/editFileT";
    }
    @RequestMapping(value = "editFile",method = RequestMethod.POST)//发布时的编辑
    @ResponseBody
    public void editFile(HttpServletRequest request){
        Literature literature = new Literature();
        String type=request.getParameter("type");
        String[] themeName = request.getParameterValues("themeName[]");
        String fileId=request.getParameter("id");
        int fileUniqueId=literatureService.fileUniqueId(themeName[0],type,fileId);
        literature.setFileId(Integer.parseInt(fileId));
        literature.setFileUniqueId(fileUniqueId);
        literature.setFileKeywords(request.getParameter("keywords"));
        literature.setFileAbstract(request.getParameter("abs"));
        literature.setFileName(request.getParameter("title"));
        literatureService.editLiterature(literature, themeName);//写入信息
        literatureService.updateUniqueId(literature);//写入唯一编号
    }
    @RequestMapping(value = "editFileT",method = RequestMethod.POST)//发布后的编辑
    @ResponseBody
    public void editFileT(HttpServletRequest request){
        Literature literature = new Literature();
        String type=request.getParameter("type");
        String[] themeName = request.getParameterValues("themeName[]");
        String fileId=request.getParameter("id");
        literature.setFileId(Integer.parseInt(fileId));
        literature.setFileKeywords(request.getParameter("keywords"));
        literature.setFileAbstract(request.getParameter("abs"));
        literature.setFileName(request.getParameter("title"));
        literatureService.editLiterature(literature, themeName);//写入信息
    }
    @RequestMapping(value = "relation", method = {RequestMethod.GET})
    @ResponseBody
    public void relation(@RequestParam("relationId") int relationId,@RequestParam("id") int id) {
        System.out.println("id1=" + relationId + "id2=" + id);
        literatureService.relationFile(relationId, id);
    }
    @RequestMapping(value = "delFileDo", method = {RequestMethod.GET})//删除
    @ResponseBody
    public void deleteFileDo(@RequestParam("id") int id) {
        literatureService.delLiterature(id);
    }


}
