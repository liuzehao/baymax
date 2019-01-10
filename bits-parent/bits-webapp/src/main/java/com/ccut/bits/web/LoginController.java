/*
* LoginController.java
* Created on  202015/2/9 14:39
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/9     panzhuowen    初始版本
*
*/

package com.ccut.bits.web;

import com.ccut.bits.model.User;
import com.ccut.bits.security.service.UserService;
import com.ccut.bits.userCenter.service.UserCenterService;
import com.ccut.bits.util.DictConstant;
import com.ccut.bits.util.LoginUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Random;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@Controller
@RequestMapping()
public class LoginController {

    @Autowired
    private UserService userService;
    @Autowired
    private UserCenterService userCenterService;

    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String login(HttpServletRequest request) {
        String page = "";
        try {
            page = request.getParameter("page");
        } catch (Exception e) {
        }
        WebUtils.getAndClearSavedRequest(request);
        request.setAttribute("page", page);
        return "login";
    }

    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String loginPost(User user,RedirectAttributes redirectAttributes,HttpSession session) {
        Subject currentUser = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getPassword(),user.isRememberMe());
        User user1 = userService.findUserByLoginName(user.getLoginName());
       // userCenterService.setUserFocus(user1);
        session.setAttribute("User",user1);
        try {
            currentUser.login(token);
        } catch (AuthenticationException e) {
            redirectAttributes.addFlashAttribute("message", "用户名或密码错误！");
            return "redirect:/login";
        }
        if(currentUser.isAuthenticated()){
            List<String> roles = userService.getRolesByLoginName(LoginUtil.getLoginName());
            if (roles.get(0).equals(DictConstant.adminRoleName)) {
                return "redirect:/admin/user/getUserList";
            }
            else if (roles.get(0).equals(DictConstant.userRoleName)){
                return "redirect:/";
            }
            return "redirect:/";
        }else{
            redirectAttributes.addFlashAttribute("message", "用户名或密码错误！");
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/validateCode", method = {RequestMethod.GET,RequestMethod.POST})
    public void validateCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String codeChars = "0123456789";//验证码的字符集合
        //关闭客户端浏览器的缓冲区。
        response.setHeader("ragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Expirse", "0");
        //设置图形大小。
        int width = 65, height = 20;
        //建立图形缓冲区。
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();//获得   Graphics 对象。
        g.setColor(getRandomColor(180, 250));//设置背景色。
        g.fillRect(0, 0, width, height);//填充背景。
        StringBuilder validationCode = new StringBuilder();//用于保存最后的验证码
        String[] fontNames = {"Times New Roman", "Arial"};//用于随机的字体的集合
        Random r = new Random();
        //随机生成3-5个验证码
        for (int i = 0; i < 4; i++) {
            g.setFont(new Font(fontNames[r.nextInt(2)], Font.BOLD, height));
            char codeChar = codeChars.charAt(r.nextInt(codeChars.length()));
            validationCode.append(codeChar);
            g.setColor(getRandomColor(10, 100));
            g.drawString(String.valueOf(codeChar), 16 * i + r.nextInt(7), height - r.nextInt(6));//在图形上输出验证码
        }
        //随机生干扰码
        for (int i = 0; i < 30; i++) {
            g.setColor(getRandomColor(90, 200));
            int x = r.nextInt(width);
            int y = r.nextInt(height);
            g.drawLine(x, y, x + r.nextInt(10), y + r.nextInt(5));
        }

        HttpSession session = request.getSession();//得到HttpSession对象
        session.setAttribute("validation", validationCode.toString());//将验证码保存在session中
        g.dispose();//关闭Graphics对象
        OutputStream os = response.getOutputStream();//得到输出流
        ImageIO.write(image, "JPEG", os);//以JPEG格式向客户端发送图形验证码
    }

    private Color getRandomColor(int minColor, int maxColor) {
        Random r = new Random();
        int red = minColor + r.nextInt(maxColor - minColor);
        int green = minColor + r.nextInt(maxColor - minColor);
        int blue = minColor + r.nextInt(maxColor - minColor);
        return new Color(red, green, blue);
    }

    @RequestMapping(value = "checkValidateCodeYesOrNot", method = {RequestMethod.POST})
    @ResponseBody
    public boolean checkValidateCodeYesOrNot(@RequestParam("validateCode") String validateCode,HttpSession session) {
        return validateCode.equals(session.getAttribute("validation"));
    }

    @RequestMapping(value = "/registration",method = RequestMethod.GET)
    public String getRegistrationPage(){
        return "registrationAsLogin";
    }
}
