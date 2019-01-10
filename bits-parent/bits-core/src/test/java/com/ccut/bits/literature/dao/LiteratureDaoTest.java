package com.ccut.bits.literature.dao;

import com.ccut.bits.constant.Constant;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.literature.service.LiteratureService;
import com.ccut.bits.lucene.LuceneIndex;
import org.apache.lucene.document.*;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import com.ccut.bits.util.SpringTransactionalTestCase;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@ContextConfiguration("/applicationContext-test.xml")
public class LiteratureDaoTest extends SpringTransactionalTestCase {

    @Autowired
    private LiteratureDao literatureDao;
    @Autowired
    private LuceneIndex luceneIndex;
    @Autowired
    private LiteratureService literature;

    @Test
    public void test()throws IOException, TasteException
    {
        List<RecommendedItem> recommend=literature.recommend(7);
        for (RecommendedItem ritem : recommend) {
        System.out.println(ritem.getItemID());
        }
    }
    @Test
    public void testGetAllLiterature() throws Exception {
        List<Literature> result = literatureDao.getAllLiterature(null, null);
        List<Document> documents = new LinkedList<Document>();
        Document document;
        for(Literature literature:result){
            document = new Document();
            document.add(new IntField(Constant.Index.Literature.FIELD_ID,literature.getId(), Field.Store.YES));
            document.add(new TextField(Constant.Index.Literature.FIELD_TITLE,literature.getTitle(),Field.Store.YES));
            document.add(new TextField(Constant.Index.Literature.FIELD_ABS,literature.getAbs(), Field.Store.YES));
            document.add(new TextField(Constant.Index.Literature.FIELD_AUTHOR,literature.getAuthorCn(),Field.Store.YES));
            document.add(new TextField(Constant.Index.Literature.FIELD_JOURNAL,literature.getJournalCn(),Field.Store.YES));
            document.add(new TextField(Constant.Index.Literature.FIELD_KEY,literature.getKey(), Field.Store.YES));
            document.add(new TextField(Constant.Index.Literature.FIELD_UNIT,literature.getUnit(),Field.Store.YES));
            document.add(new StringField(Constant.Index.Literature.FIELD_DATE,literature.getAppDate(),Field.Store.YES));
            document.add(new StringField(Constant.Index.CLASS,Constant.Index.LITERATURE, Field.Store.YES));
            documents.add(document);
        }
        long begin = System.currentTimeMillis();
        luceneIndex.createIndex(documents);
        long end = System.currentTimeMillis();
        System.out.println("创建用时:" + (end - begin) + " ms");
    }
}