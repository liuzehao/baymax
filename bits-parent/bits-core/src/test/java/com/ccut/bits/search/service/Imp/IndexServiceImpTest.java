package com.ccut.bits.search.service.Imp;

import com.ccut.bits.index.IndexService;
import com.ccut.bits.index.IndexServiceImp;
import com.ccut.bits.util.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import java.io.File;
import java.io.FileOutputStream;

@ContextConfiguration("/applicationContext-test.xml")
public class IndexServiceImpTest extends SpringTransactionalTestCase {
    @Autowired
    IndexService indexService;
    @Autowired
    IndexServiceImp  indexServiceImp;
    @Test
    public void testCreateLiteratureIndex() throws Exception {
        indexService.initLiteratureIndex();
    }
    @Test
    public void testCreateExpertIndex() throws Exception {
        indexService.initExpertIndex();
    }
    @Test
    public void testCreatePatentIndex() throws Exception {
        indexService.initPatentIndex();
    }
    @Test
    public void indexServiceImp() throws Exception {
        File file=new File("D:\\testindex\\加密测试.zip");
       String a= indexServiceImp.tikaTool(file);
       System.out.println(a);
        try {
            FileOutputStream fos = new FileOutputStream("D:\\文明是副产品.txt");
            fos.write(a.getBytes());
            fos.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("文件转换出错");
            e.printStackTrace();
        }

    }
}