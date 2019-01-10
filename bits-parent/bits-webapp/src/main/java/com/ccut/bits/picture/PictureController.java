package com.ccut.bits.picture;

import com.ccut.bits.autocomplete.service.AutoCompleteService;
import com.ccut.bits.expert.service.ExpertService;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.literature.service.LiteratureService;
import com.ccut.bits.page.Page;
import com.ccut.bits.page.PageResponse;
import com.ccut.bits.patent.model.Patent;
import com.ccut.bits.patent.service.PatentService;
import com.ccut.bits.picture.model.Picture;
import com.ccut.bits.picture.service.PictureService;
import com.ccut.bits.page.Pagination;
import com.ccut.bits.picture.model.Picture;
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
@RequestMapping("/picture")

public class PictureController {
    @Autowired
    private PictureService pictureService;
    //@Autowired
    //private ExpertService expertService;
    @Autowired
    private LiteratureService literatureService;

    @RequestMapping("/getPictureList")
    public String getPictureList(HttpServletRequest request, Model model) {
        Page page = new Page(request);
        List<Picture> result = pictureService.getAllPicture(page);
        Pagination pagination = new Pagination(page, pictureService.getTotalRecord(),null);
        for(Picture p:result)
        {
            p.setRelations(literatureService.getRelationByFileId(p.getFileId()));
        }

        model.addAttribute("result",result);
        model.addAttribute("Pagination",pagination.getPagination());

        return "picture/getPictureList";
    }

   /* @RequestMapping("/getAllPictureList")
    public String getAllPictureList(HttpServletRequest request, Model model) {
        //Page page = new Page(request);
        //List<Picture> result = pictureService.getAllPicture(page);
        //Pagination pagination = new Pagination(page, pictureService.getTotalRecord(),null);

        //model.addAttribute("result",result);
       // model.addAttribute("Pagination",pagination.getPagination());

        return "picture/getAllPictureList";
    }*/
}
