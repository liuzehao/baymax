/*
* ExpertRecommendController.java
* Created on  2015-4-7 下午12:26
* 版本       修改时间          作者      修改内容
* V1.0.1    2015-4-7       weixuda    初始版本
*
*/
package com.ccut.bits.expertrecommend;

import com.ccut.bits.expert.model.ExpertRank;
import com.ccut.bits.expert.service.ExpertService;
import com.ccut.bits.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */
@Controller
@RequestMapping("/expertRecommend")
public class ExpertRecommendController {
    @Autowired
    private ExpertService expertService;

    @RequestMapping("/getExpertRecommend")
    public String getExpertRecommend() {
        return "expertRecommend/getExpertRecommend";
    }

    @RequestMapping("/getExpertRecommendDetail")
    public String getExpertRecommendDetail(@RequestParam("content")String content,Model model) {
        if (StringUtil.isEmpty(content)) return "redirect:/expertRecommend/getExpertRecommend";
        Map<String,List<ExpertRank>> resultMap = expertService.getRecommend(content);
        if (resultMap.isEmpty()) return "redirect:/noRecord";
        model.addAttribute("resultMap",resultMap);
        return "expertRecommend/getExpertRecommendDetail";
    }
}
