package com.ccut.bits.expert.service;

import com.ccut.bits.util.SpringTransactionalTestCase;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

@ContextConfiguration("/applicationContext-test.xml")
public class ExpertServiceImpTest extends SpringTransactionalTestCase {
    @Autowired
    private ExpertService expertService;
    @Test
    public void testGetRecommend() throws Exception {
        long b = System.currentTimeMillis();
        System.out.println(expertService.getRecommend("ICF分解 软件 sio2"));
        long e = System.currentTimeMillis();
        System.out.println(e-b);
    }
}