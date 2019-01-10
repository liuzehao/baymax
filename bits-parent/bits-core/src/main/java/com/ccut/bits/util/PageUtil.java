package com.ccut.bits.util;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * Created by Demon on 2015/4/12.
 */
public class PageUtil {

    public static String encoding(String str,String oldEncoding,String newEncoding){
        String result = null;
        try {
            result = new String(str.getBytes(oldEncoding),newEncoding);
        } catch (UnsupportedEncodingException e) {
            System.out.println("转码错误");
        }
        finally {
            return result;
        }
    }

    public static String getUrlParamsByMap(Map<String,String[]> paramMap,String oldEncoding,String newEncoding){
            if (paramMap == null) {
                return "";
            }
            StringBuffer stringBuffer = new StringBuffer();
            for (Map.Entry<String, String[]> entry : paramMap.entrySet()) {
                for(String str:entry.getValue()){
                    stringBuffer.append(entry.getKey() + "=" + PageUtil.encoding(str,oldEncoding,newEncoding));
                    stringBuffer.append("&");
                }
            }
            stringBuffer.deleteCharAt(stringBuffer.length() - 1);
            String result = stringBuffer.toString();
            return result;
    }

    public static String serialize(Map<String,Object> map){
        StringBuffer str = new StringBuffer();
        for(Map.Entry<String,Object> entry:map.entrySet()){
            str.append(entry.getKey() + "=" + entry.getValue());
            str.append("&");
        }
        str.deleteCharAt(str.length() - 1);
        return str.toString();
    }
}
