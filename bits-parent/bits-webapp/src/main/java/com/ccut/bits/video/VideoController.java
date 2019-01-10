package com.ccut.bits.video;

import com.ccut.bits.autocomplete.service.AutoCompleteService;
import com.ccut.bits.expert.service.ExpertService;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.literature.service.LiteratureService;
import com.ccut.bits.page.Page;
import com.ccut.bits.page.PageResponse;
import com.ccut.bits.page.Pagination;
import com.ccut.bits.util.StringUtil;
import com.ccut.bits.video.model.Video;
import com.ccut.bits.video.service.VideoService;
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
 * Created by SunJQ on 2016/4/26.
 */

@Controller
@RequestMapping("/video")
public class VideoController {
    @Autowired
    VideoService videoService;
    @RequestMapping("/getVideoSingle")
    public String getVideoSingle(@RequestParam("id")Integer id, Model model) {
     Video video=  videoService.getVideoById(id);
        model.addAttribute("video", video);

        return "video/videoSingle";
    }
}
