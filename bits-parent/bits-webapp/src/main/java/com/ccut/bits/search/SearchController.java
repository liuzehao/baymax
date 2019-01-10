package com.ccut.bits.search;

import com.ccut.bits.audio.model.Audio;
import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.intelligence.model.Intelligence;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.literature.service.LiteratureService;
import com.ccut.bits.page.Pagination;
import com.ccut.bits.picture.model.Picture;
import com.ccut.bits.search.model.SearchRequest;
import com.ccut.bits.search.model.SearchResponse;
import com.ccut.bits.patent.model.Patent;
import com.ccut.bits.util.PageUtil;
import com.ccut.bits.video.model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Demon on 2015/4/15.
 */
@Controller
@RequestMapping("/**/search")
public class SearchController {
    @Autowired
    private SearchService searchService;
    @Autowired
    private LiteratureService literatureService;
    @RequestMapping(value = "/", params = {"direction=global"})
    public String globalSearch(HttpServletRequest request, Model model) {
        SearchRequest searchRequest = new SearchRequest(request);
        if (searchRequest.isValid()) return "redirect:/";
        HashMap<String, Object> otherParam = new HashMap<>();
        otherParam.put("key", searchRequest.getKey());
        otherParam.put("direction", searchRequest.getDirection());
        SearchResponse<Intelligence> response = searchService.searchGlobal(searchRequest);
        if (response.getResult().isEmpty()) return "redirect:/noRecord";
        Pagination pagination = new Pagination(searchRequest.getPage(), response.getTotalHits(), PageUtil.serialize(otherParam));

        model.addAttribute("result", response.getResult());
        model.addAttribute("Pagination", pagination.getPagination());
        model.addAttribute("totalHits", response.getTotalHits());

        return "search/global";
    }

    @RequestMapping(value = "/", params = {"direction=literature"})
    public String searchLiterature(HttpServletRequest request, Model model) {
        SearchRequest searchRequest = new SearchRequest(request);
        if (searchRequest.isValid()) return "redirect:/literature/getLiteratureList";
        HashMap<String, Object> otherParam = new HashMap<>();
        otherParam.put("key", searchRequest.getKey());
        otherParam.put("field", searchRequest.getField());
        otherParam.put("direction", searchRequest.getDirection());
        SearchResponse<Literature> response = searchService.searchLiterature(searchRequest);
        if (response.getResult().isEmpty()) return "redirect:/noRecord";
        Pagination pagination = new Pagination(searchRequest.getPage(), response.getTotalHits(), PageUtil.serialize(otherParam));

        model.addAttribute("result", response.getResult());
        model.addAttribute("Pagination", pagination.getPagination());

        return "literature/getLiteratureList";
    }

    @RequestMapping(value = "/", params = {"direction=all"})
    public String searchAll(HttpServletRequest request, Model model) {
        SearchRequest searchRequest = new SearchRequest(request);
        if (searchRequest.isValid()) return "redirect:/literature/getLiteratureList";
        HashMap<String, Object> otherParam = new HashMap<>();
        otherParam.put("key", searchRequest.getKey());
        otherParam.put("field", searchRequest.getField());
        otherParam.put("direction", searchRequest.getDirection());
        SearchResponse<Literature> response = searchService.searchAll(searchRequest);
        if (response.getResult().isEmpty()) return "redirect:/noRecord";
        Pagination pagination = new Pagination(searchRequest.getPage(), response.getTotalHits(), PageUtil.serialize(otherParam));

        model.addAttribute("result", response.getResult());
        model.addAttribute("Pagination", pagination.getPagination());

        return "literature/getLiteratureList";
    }

    @RequestMapping(value = "/", params = {"direction=autoAnswer"})
    @ResponseBody
    public List<Literature> autoAnswer(HttpServletRequest request) {
        SearchRequest searchRequest = new SearchRequest(request);
        HashMap<String, Object> otherParam = new HashMap<>();
        otherParam.put("key", searchRequest.getKey());
        otherParam.put("field", searchRequest.getField());
        otherParam.put("direction", searchRequest.getDirection());
        SearchResponse<Literature> response = searchService.searchAll(searchRequest);

        return response.getResult();
    }


    @RequestMapping(value = "/", params = {"direction=patent"})
    public String searchPatent(HttpServletRequest request, Model model) {
        SearchRequest searchRequest = new SearchRequest(request);
        if (searchRequest.isValid()) return "redirect:/patent/getPatentList";
        HashMap<String, Object> otherParam = new HashMap<>();
        otherParam.put("key", searchRequest.getKey());
        otherParam.put("field", searchRequest.getField());
        otherParam.put("direction", searchRequest.getDirection());
        SearchResponse<Patent> response = searchService.searchPatent(searchRequest);
        if (response.getResult().isEmpty()) return "redirect:/noRecord";
        Pagination pagination = new Pagination(searchRequest.getPage(), response.getTotalHits(), PageUtil.serialize(otherParam));

        model.addAttribute("result", response.getResult());
        model.addAttribute("Pagination", pagination.getPagination());

        return "patent/getPatentList";
    }

    @RequestMapping(value = "/", params = {"direction=expert"})
    public String searchExpert(HttpServletRequest request, Model model) {
        SearchRequest searchRequest = new SearchRequest(request);
        if (searchRequest.isValid()) return "redirect:/expert/getExpertList";
        HashMap<String, Object> otherParam = new HashMap<>();
        otherParam.put("key", searchRequest.getKey());
        otherParam.put("field", searchRequest.getField());
        otherParam.put("direction", searchRequest.getDirection());
        SearchResponse<Expert> response = searchService.searchExpert(searchRequest);
        if (response.getResult().isEmpty()) return "redirect:/noRecord";
        Pagination pagination = new Pagination(searchRequest.getPage(), response.getTotalHits(), PageUtil.serialize(otherParam));

        model.addAttribute("result", response.getResult());
        model.addAttribute("totalHits",response.getTotalHits());
        model.addAttribute("Pagination", pagination.getPagination());

        return "expert/getExpertList";
    }
    @RequestMapping(value = "/", params = {"direction=video"})
    public String searchVideo(HttpServletRequest request, Model model) {
        SearchRequest searchRequest = new SearchRequest(request);
        if (searchRequest.isValid()) return "redirect:/video/getVideoList";
        HashMap<String, Object> otherParam = new HashMap<>();
         otherParam.put("key", searchRequest.getKey());
        otherParam.put("field", searchRequest.getField());
        otherParam.put("direction", searchRequest.getDirection());
        SearchResponse<Video> response = searchService.searchVideo(searchRequest);
          if (response.getResult().isEmpty()) return "redirect:Record";
           Pagination pagination = new Pagination(searchRequest.getPage(), response.getTotalHits(), PageUtil.serialize(otherParam));

          model.addAttribute("result", response.getResult());
           model.addAttribute("Pagination", pagination.getPagination());

        return "video/getVideoList";
    }
    @RequestMapping(value = "/", params = {"direction=audio"})
    public String searchAudio(HttpServletRequest request, Model model) {

        SearchRequest searchRequest = new SearchRequest(request);
        String key = null;
        if (searchRequest.isValid()) return "redirect:/video/getVideoList";
        HashMap<String, Object> otherParam = new HashMap<>();
        otherParam.put("key", key);
        otherParam.put("field", searchRequest.getField());
        otherParam.put("direction", searchRequest.getDirection());
        SearchResponse<Audio> response = searchService.searchAudio(searchRequest);
        if (response.getResult().isEmpty()) return "redirect:Record";
        Pagination pagination = new Pagination(searchRequest.getPage(), response.getTotalHits(), PageUtil.serialize(otherParam));

        model.addAttribute("result", response.getResult());
        model.addAttribute("Pagination", pagination.getPagination());

        return "audio/getAudioList";
    }
    @RequestMapping(value = "/", params = {"direction=picture"})
    public String searchPicture(HttpServletRequest request, Model model) {
        SearchRequest searchRequest = new SearchRequest(request);
        if (searchRequest.isValid()) return "redirect:/picture/getPictureList";
        HashMap<String, Object> otherParam = new HashMap<>();
        otherParam.put("key", searchRequest.getKey());
        otherParam.put("field", searchRequest.getField());
        otherParam.put("direction", searchRequest.getDirection());
        SearchResponse<Picture> response = searchService.searchPicture(searchRequest);
        for(Picture p:response.getResult())
        {
            p.setRelations(literatureService.getRelationByFileId(p.getFileId()));
        }
        if (response.getResult().isEmpty()) return "redirect:/noRecord";
        Pagination pagination = new Pagination(searchRequest.getPage(), response.getTotalHits(), PageUtil.serialize(otherParam));

        model.addAttribute("result", response.getResult());
        model.addAttribute("Pagination", pagination.getPagination());

        return "picture/getPictureList";
    }
}
