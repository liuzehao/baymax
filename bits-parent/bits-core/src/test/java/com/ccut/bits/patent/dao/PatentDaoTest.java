package com.ccut.bits.patent.dao;

import com.ccut.bits.constant.Constant;
import com.ccut.bits.lucene.LuceneIndex;
import com.ccut.bits.patent.model.Patent;
import com.ccut.bits.util.SpringTransactionalTestCase;
import org.apache.lucene.document.*;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import java.util.LinkedList;
import java.util.List;

@ContextConfiguration("/applicationContext-test.xml")
public class PatentDaoTest extends SpringTransactionalTestCase {
    @Autowired
    PatentDao patentDao;
    @Autowired
    LuceneIndex luceneIndex;

    @Test
    public void testGetAllPatent() throws Exception {
        List<Patent> result = patentDao.getAllPatent(null, null);
        List<Document> documents = new LinkedList<Document>();
        Document document;
        for(Patent patent:result){
            document = new Document();
            document.add(new IntField(Constant.Index.Patent.FIELD_ID,patent.getId(), Field.Store.YES));
            document.add(new TextField(Constant.Index.Patent.FIELD_TITLE,patent.getTitle(),Field.Store.YES));
            document.add(new TextField(Constant.Index.Patent.FIELD_ABS,patent.getAbs(), Field.Store.YES));
            document.add(new TextField(Constant.Index.Patent.FIELD_APPLICANT,patent.getApplicant(),Field.Store.YES));
            document.add(new TextField(Constant.Index.Patent.FIELD_INVENTOR,patent.getInventor(), Field.Store.YES));
            document.add(new StringField(Constant.Index.Patent.FIELD_DATE,patent.getDate(),Field.Store.YES));
            document.add(new StringField(Constant.Index.CLASS,Constant.Index.PATENT, Field.Store.YES));
            documents.add(document);
        }
        long begin = System.currentTimeMillis();
        luceneIndex.createIndex(documents);
        long end = System.currentTimeMillis();
        System.out.println("创建用时:" + (end - begin) + " ms");
    }
}