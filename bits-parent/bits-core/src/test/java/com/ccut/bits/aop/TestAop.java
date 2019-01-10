package com.ccut.bits.aop;

import com.ccut.bits.expert.service.ExpertService;
//import com.ccut.bits.recommend.Recommend;
import com.ccut.bits.util.SpringTransactionalTestCase;
import org.apache.ibatis.executor.loader.cglib.CglibProxyFactory;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;

import java.io.IOException;
import java.util.Random;

/**
 * Created by Dintama on 2015/8/6.
 */
@ContextConfiguration("/applicationContext-test.xml")
public class TestAop extends SpringTransactionalTestCase {

    @Autowired
    ExpertService expertService;

    @Test
    public void testAop(){
        expertService.getExpertById(12);
    }


    @Test
    public void lalala(){
        Random random = new Random(10);
        Integer[] list = {1,2,3,4, 5, 6,7,8,9,10};
        Integer[] result = new Integer[10];
        int p;
        for(int i = 0; i < 10; i++){
            p = random.nextInt();
            result[i] = list[p];
            System.out.print(result[i] + "\t");
        }
        System.out.println();

    }
}
