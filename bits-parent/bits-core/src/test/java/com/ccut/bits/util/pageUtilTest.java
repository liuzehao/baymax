package com.ccut.bits.util;

import com.ccut.bits.constant.Constant.Page;
import junit.framework.TestCase;
import org.junit.Test;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

public class pageUtilTest extends TestCase {

    @Test
    public void testEncoding() throws Exception {
      //  System.out.println(PageUtil.encoding("field=title&key=%E9%AB%98%E5%86%B7", PageUtil.DEFAULT_ENCODING, PageUtil.UTF_8_ENCODING));
        System.out.println(new String("field=title&key=%E9%AB%98%E5%86%B7".getBytes("UTF-8"),"UTF-8"));
        System.out.println(URLDecoder.decode("field=title&key=%E9%AB%98%E5%86%B7","UTF-8"));
    }
    public void testGetUrlParamsByMap(){
        Map<String,String[]> map = new HashMap<String,String[]>();
        map.put("p1",new String[]{"1","2"});
        map.put("p2",new String[]{"3"});
        map.put("p3",new String[]{"高冷"});
        System.out.println(PageUtil.getUrlParamsByMap(map, Page.ISO_8859_1, Page.UTF_8));

    }
}