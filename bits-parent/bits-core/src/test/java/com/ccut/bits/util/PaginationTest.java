package com.ccut.bits.util;

import com.ccut.bits.page.Pagination;
import junit.framework.TestCase;
import org.junit.Test;

public class PaginationTest extends TestCase {

    @Test
    public void testGetPagination() throws Exception {
        Pagination pagination = new Pagination(29,10,290,null);
        for(String s:pagination.getPagination()){
          System.out.println(s);
        }
    }
}