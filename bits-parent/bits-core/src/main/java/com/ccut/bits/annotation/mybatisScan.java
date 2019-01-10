/*
* mybatis.java
* Created on  202015/2/6 10:04
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/2/6       panzhuowen    初始版本
*
*/
package com.ccut.bits.annotation;

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

/**
 * 类的描述信息
 * mybatis接口标注标签类
 * @author panzhuowen
 * @version 1.0.1
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE})
@Documented
@Component
public @interface mybatisScan {
    String value() default "";
}
