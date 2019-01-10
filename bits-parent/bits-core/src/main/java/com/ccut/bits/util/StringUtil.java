/*
* StringUtil.java
* Created on  202015/2/7 14:35
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/7     panzhuowen    初始版本
*
*/

package com.ccut.bits.util;

import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public class StringUtil {
    public StringUtil() {
    }

    public static boolean notEmpty(String s) {
        return s != null && !"".equals(s) && !"null".equals(s);
    }

    public static boolean isEmpty(String s) {
        return s == null || "".equals(s) || "null".equals(s);
    }

    public static List<String> StringToList(String str) {
        String[] returnStr = str.split(",");
        return Arrays.asList(returnStr);
    }

    public static StringBuilder deleteLastChar(StringBuilder StrBuilder) {
        if(StrBuilder.length() > 1) {
            StrBuilder.deleteCharAt(StrBuilder.length() - 1);
        }

        return StrBuilder;
    }

    public static String getBusinessIdDate(String operateTime) {
        return operateTime.replace("-", "").substring(2, 8);
    }

    public static String[] trimStringArray(String[] arr){
        if (arr == null) return null;
        String[] newArr = new String[arr.length];
        for (int i = 0,j = arr.length; i < j;i++){
            newArr[i] = arr[i].trim();
        }
        return newArr;
    }

    public static String[] ListToArray(List<String> list){
        String[] arr = new String[list.size()];
        Object[] objects = list.toArray();
        for (int i = 0,j = arr.length;i<j;i++) arr[i] = objects[i].toString();
        return arr;
    }

    public static String[] SetToArray(Set set){
        String[] arr = new String[set.size()];
        Object[] objects = set.toArray();
        for (int i = 0,j = arr.length;i<j;i++) arr[i] = objects[i].toString();
        return arr;
    }

    public static List<String> SetToList(Set<String> set){
        List<String> list = new LinkedList<>();
        list.addAll(set);
        return list;
    }

    //正则表达式去除中文以外的字符。
    public String clearNotChinese(String buff){

        String tmpString =buff.replaceAll("(?i)[^a-zA-Z0-9\u4E00-\u9FA5]", "");//去掉所有中英文符号

        char[] carr = tmpString.toCharArray();

        for(int i = 0; i<tmpString.length();i++){

            if(carr[i] < 0xFF){

                carr[i] = ' ' ;//过滤掉非汉字内容

            }

        }

        return String.copyValueOf(carr).trim();

    }

    public static boolean isValidString(String content){
        IKAnalyzer analyzer = new IKAnalyzer(true);
        TokenStream stream = null;
        try {
            stream = analyzer.tokenStream("content", content);
            stream.reset();
//            while (stream.incrementToken()){
//                CharTermAttribute attribute = stream.getAttribute(CharTermAttribute.class);
//                System.out.println(attribute);
//            }
//            return false;
            return stream.incrementToken();
        }catch (IOException e){
            return false;
        }
    }
}

