package com.ccut.bits.audio;


/**
 * Created by SunJQ on 2016/4/26.
 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
//页面跳转 可删除
@Controller
@RequestMapping("/audio")
public class AudioController {


    @RequestMapping("/getIndex")
    public String getIndex(HttpServletRequest request, Model model) {
        return "audio/getAudioIndex";
    }

    @RequestMapping("/getGenres")
    public String getGenres(HttpServletRequest request, Model model) {
        return "audio/getAudioGenres";
    }

    @RequestMapping("/getEvents")
    public String getEvents(HttpServletRequest request, Model model) {
        return "audio/getAudioEvents";
    }

    @RequestMapping("/getListen")
    public String getListen(HttpServletRequest request, Model model) {
        return "audio/getAudioListen";
    }

    @RequestMapping("/getVideo")
    public String getVideo(HttpServletRequest request, Model model) {
        return "audio/getAudioVideo";
    }

    @RequestMapping("/getVideoDetail")
    public String getVideoDetail(HttpServletRequest request, Model model) {
        return "audio/getAudioVideoDetail";
    }

    @RequestMapping("/getAudioList")
    public String getLiteratureList(HttpServletRequest request,Model model) {

        // Page page = new Page(request);
        // List<Literature> result = literatureService.getAllLiterature(page);
        //  Pagination pagination = new Pagination(page, literatureService.getTotalRecord(),null);
        // model.addAttribute("result",result);
        //  model.addAttribute("Pagination",pagination.getPagination());
        return "audio/getAudioIndex";
    }

}
