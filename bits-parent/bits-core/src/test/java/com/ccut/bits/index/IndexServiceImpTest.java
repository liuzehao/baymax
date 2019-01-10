package com.ccut.bits.index;

import com.ccut.bits.lucene.LuceneIndex;
import com.ccut.bits.util.SpringTransactionalTestCase;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

@ContextConfiguration("/applicationContext-test.xml")
public class IndexServiceImpTest extends SpringTransactionalTestCase {
    @Autowired
    private IndexService indexService;
    @Autowired
    private LuceneIndex luceneIndex;
    @Test
    public void test() throws Exception {
        indexService.autoCreateIndex();
    }

}