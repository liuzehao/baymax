/*
* AutoAnswering.java
* Created on  2015-4-8 上午9:58
* 版本       修改时间          作者      修改内容
* V1.0.1    2015-4-8       weixuda    初始版本
*
*/
package com.ccut.bits.autoanswer;

import com.ccut.bits.autoanswer.model.Solution;
import com.ccut.bits.autoanswer.service.AutoAnswerService;
import com.ccut.bits.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
@Controller
@RequestMapping("/autoAnswer")
public class AutoAnswerController {
    @Autowired
    private AutoAnswerService autoAnswerService;

    @RequestMapping("/getPage")
    public String getAutoAnswerPage() {
        return "autoAnswer/getAutoAnswerPage";
    }

    @RequestMapping(value = "/getAnswer",method = RequestMethod.POST)
    @ResponseBody
    public Solution getAnswer(@RequestParam("question") String question){
       return autoAnswerService.getAnswer(question);
    }

    @RequestMapping(value = "/sendMail", method = RequestMethod.POST)
    @ResponseBody
    public int sendMail(@RequestParam String email, @RequestParam String subject, @RequestParam String body,@RequestParam String user, @RequestParam String password){
        if(!autoAnswerService.isValidString(subject) || !autoAnswerService.isValidString(body)){
            return 0;       //表示标题或内容无意义！
        }else if(!autoAnswerService.sendEmail(email, subject, body, user, password)){
            return 1;       //表示连接时出错，确认账号密码是否正确以及smtp服务是否开启！
        }
        return 2;   //正常，邮件发送成功！
    }
}
