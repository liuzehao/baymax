/*
* IndustryKnowledge.java
* Created on  2015-4-8 下午4:09
* 版本       修改时间          作者      修改内容
* V1.0.1    2015-4-8       weixuda    初始版本
*
*/
package com.ccut.bits.industryknowledge;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */
@Controller
@RequestMapping("/industryKnowledge")
public class IndustryKnowledgeController {
    @RequestMapping("/getIndustryKnowledge")
    public String getIndustryKnowledge() {
        return "industryKnowledge/getIndustryKnowledgeList";
    }
}
