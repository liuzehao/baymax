package com.ccut.bits.aop;

import com.ccut.bits.model.User;
import com.ccut.bits.security.service.UserService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Dintama on 2015/8/9.
 */
@Aspect
public class UserAdvice {

    @Autowired
    private UserService userService;

    @Pointcut("execution(* getLiteratureById*(..))")
    private void addAddMethod(){
        System.out.println("测试：并不会被调用输出");
    }

    @Before("addAddMethod()")
    private void beforeExecute(JoinPoint point){
        HttpSession session = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession();
        Date date=new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=format.format(date);
        User user = (User)session.getAttribute("User");
        if(user == null){
            System.out.println("该用户尚未登录");
            return;
        }
        Object[] args = point.getArgs();
        userService.addUserHistory(user.getUserId(), Integer.parseInt(args[0].toString()),time);
        System.out.println("记录用户浏览信息……");
    }

    @After("addAddMethod()")
    private void afterExecute(){
        System.out.println("完成。");
    }


}
