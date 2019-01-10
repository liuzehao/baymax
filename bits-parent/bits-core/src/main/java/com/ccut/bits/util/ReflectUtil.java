/*
* ReflectUtil.java
* Created on  202015/2/7 14:07
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/7     panzhuowen    初始版本
*
*/

package com.ccut.bits.util;

import java.lang.reflect.Field;

/**
 * 类的描述信息
 * 代理工具类
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public class ReflectUtil {

    public ReflectUtil() {
    }

    public static Field getFieldByFieldName(Object obj, String fieldName) {
        Field field = null;
        Class clazz = obj.getClass();

        while (clazz != Object.class) {
            try {
                field = clazz.getDeclaredField(fieldName);
                break;
            } catch (NoSuchFieldException var5) {
                clazz = clazz.getSuperclass();
            }
        }

        return field;
    }

    public static <T> T getValueByFieldName(Object obj, String fieldName) {
        Object result = null;
        Field field = getFieldByFieldName(obj, fieldName);
        if (field != null) {
            field.setAccessible(true);

            try {
                result = field.get(obj);
            } catch (IllegalArgumentException var5) {
                var5.printStackTrace();
            } catch (IllegalAccessException var6) {
                var6.printStackTrace();
            }
        }

        return (T) result;
    }

    public static void setValueByFieldName(Object obj, String fieldName, Object value) throws SecurityException, NoSuchFieldException, IllegalArgumentException, IllegalAccessException {
        Field field = obj.getClass().getDeclaredField(fieldName);
        if (field.isAccessible()) {
            field.set(obj, value);
        } else {
            field.setAccessible(true);
            field.set(obj, value);
            field.setAccessible(false);
        }

    }
}
