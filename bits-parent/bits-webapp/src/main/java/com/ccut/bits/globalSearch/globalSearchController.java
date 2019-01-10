package com.ccut.bits.globalSearch;
import com.ccut.bits.audio.model.Audio;
import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.intelligence.model.Intelligence;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.literature.service.LiteratureService;
import com.ccut.bits.page.Pagination;
import com.ccut.bits.picture.model.Picture;
import com.ccut.bits.search.SearchService;
import com.ccut.bits.search.model.SearchRequest;
import com.ccut.bits.search.model.SearchResponse;
import com.ccut.bits.patent.model.Patent;
import com.ccut.bits.util.PageUtil;
import com.ccut.bits.video.model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

/**
 * Created by Demon on 2015/4/15.
 */

/**
 * Created by SunJQ on 2016/5/24.
 */
@Controller
@RequestMapping("/**/search1")
public class globalSearchController {
    @Autowired
    private SearchService searchService;
    @Autowired
    private LiteratureService literatureService;

    @RequestMapping(value = "/", params = {"direction=all1"})
    public String searchAll1(HttpServletRequest request, Model model) {

        SearchRequest searchRequest = new SearchRequest(request);

        if (searchRequest.isValid()) return "redirect:/literature/search";
        HashMap<String, Object> otherParam = new HashMap<>();

        otherParam.put("key", searchRequest.getKey());
        otherParam.put("key1", searchRequest.getKey1());
        otherParam.put("key2", searchRequest.getKey2());
        otherParam.put("key3", searchRequest.getKey3());
        otherParam.put("key4", searchRequest.getKey4());
        otherParam.put("key5", searchRequest.getKey5());


        otherParam.put("field", searchRequest.getField());
        otherParam.put("field1", searchRequest.getField1());
        otherParam.put("field2", searchRequest.getField2());
        otherParam.put("field3", searchRequest.getField3());
        otherParam.put("field4", searchRequest.getField4());
        otherParam.put("field5", searchRequest.getField5());


        otherParam.put("judge", searchRequest.getJudge());
        otherParam.put("judge1", searchRequest.getJudge1());
        otherParam.put("judge2", searchRequest.getJudge2());
        otherParam.put("judge3", searchRequest.getJudge3());
        otherParam.put("judge4", searchRequest.getJudge4());


        otherParam.put("accurate", searchRequest.getAccurate());
        otherParam.put("accurate1", searchRequest.getAccurate1());
        otherParam.put("accurate2", searchRequest.getAccurate2());
        otherParam.put("accurate3", searchRequest.getAccurate3());
        otherParam.put("accurate4", searchRequest.getAccurate4());
        otherParam.put("accurate5", searchRequest.getAccurate5());


        otherParam.put("year", searchRequest.getYear());
        otherParam.put("year1", searchRequest.getYear1());

        otherParam.put("direction", searchRequest.getDirection());

        SearchResponse<Literature> response = searchService.searchAll1(searchRequest);

        if (response.getResult().isEmpty()) return "redirect:/noRecord";
        Pagination pagination = new Pagination(searchRequest.getPage(), response.getTotalHits(), PageUtil.serialize(otherParam));

        model.addAttribute("result", response.getResult());
        model.addAttribute("Pagination", pagination.getPagination());

        return "literature/getLiteratureList";

    }

    @RequestMapping(value = "/", params = {"direction=all2"})
    public String searchAll2(HttpServletRequest request, Model model) {
        SearchRequest searchRequest = new SearchRequest(request);
        if (searchRequest.isValid()) return "redirect:/literature/search";
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

    @RequestMapping(value = "/", params = {"direction=global1"})
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
}
