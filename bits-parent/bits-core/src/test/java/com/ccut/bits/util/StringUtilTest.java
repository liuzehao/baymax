package com.ccut.bits.util;

import junit.framework.TestCase;

public class StringUtilTest extends TestCase {

    public void testTrimStringArray() throws Exception {
        String s = "金颖; 周伟国; 阮应君;";
        String[] arr = s.split(";");
        arr = StringUtil.trimStringArray(arr);
        for (String str:arr){
            System.out.println(str + "  "+ str.contains(" "));
        }
    }
}