package com.ccut.bits.lucene;

import com.ccut.bits.constant.Constant;
import com.ccut.bits.search.SearchService;
import com.ccut.bits.util.SpringTransactionalTestCase;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@ContextConfiguration("/applicationContext-test.xml")
public class LuceneSearchTest extends SpringTransactionalTestCase {
    @Autowired
    LuceneContext luceneContext;
    @Autowired
    LuceneSearch luceneSearch;
    @Autowired
    SearchService searchService;
    @Test
    public void testLuceneContext(){

        try {

            System.out.println(luceneContext == null);
            long a = System.currentTimeMillis();
            SearcherManager manager = luceneContext.getSearcherManager();
            long b = System.currentTimeMillis();
            long c = System.currentTimeMillis();
            IndexSearcher searcher = manager.acquire();
            long d = System.currentTimeMillis();
            long e = System.currentTimeMillis();
            QueryParser parser = new QueryParser(luceneContext.Version,Constant.Index.Literature.FIELD_TITLE, new IKAnalyzer());
            Query termQ = new TermQuery(new Term("name",""));
            long f = System.currentTimeMillis();
            long g = System.currentTimeMillis();
            Query query = parser.parse("我是谁");
            long h = System.currentTimeMillis();
            long i = System.currentTimeMillis();
            Filter filter = new FieldCacheTermsFilter(Constant.Index.CLASS,Constant.Index.LITERATURE);

            Filter filter1 = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS,Constant.Index.LITERATURE)));
            TopDocs topDocs = searcher.search(query,filter1,20);

            long j = System.currentTimeMillis();
            long k = System.currentTimeMillis();
            ScoreDoc[] docs = topDocs.scoreDocs;
            long l = System.currentTimeMillis();
            long n = System.currentTimeMillis();

            for (ScoreDoc doc:docs){
                long t1 = System.currentTimeMillis();
                System.out.println(searcher.doc(doc.doc));
                System.out.println("" + doc.score + "  time:" + (System.currentTimeMillis() - t1));
            }
            long m = System.currentTimeMillis();
            System.out.println("manage "+ (b-a));
            System.out.println("searcher " + (e-c));
            System.out.println("QueryParser " + (f-d));
            System.out.println("QueryParser->parser " + (h-g));
            System.out.println("TopDocs "+(j-i));
            System.out.println("docs "+(l-k));
            System.out.println("foreach "+(m-n));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testSimpleSearcher() throws Exception {
        Filter filter1 = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS,Constant.Index.LITERATURE)));
        QueryParser parser = new QueryParser(luceneContext.Version,Constant.Index.Literature.FIELD_TITLE, new IKAnalyzer());
        Query query = parser.parse("分解");
        List<Document> docs  = luceneSearch.search(query,filter1);
        for(Document doc : docs){
            System.out.println(Constant.Index.PATENT.equals(doc.get(Constant.Index.CLASS))?"yes" : "no");
        }
    }
    @Test
    public void testIK() throws Exception{
        Analyzer analyzer = new IKAnalyzer(true);
        TokenStream tokenStream = analyzer.tokenStream("","一种有机导电纤维");
        tokenStream.reset();
        List<String> list = new LinkedList<>();
        while (tokenStream.incrementToken()){
            CharTermAttribute attribute = tokenStream.getAttribute(CharTermAttribute.class);
            list.add(attribute.toString());
        }
        System.out.println(list.toString());
    }
    @Test
    public void testS(){
        Query query = new RegexpQuery(new Term(Constant.Index.Expert.FIELD_NAME,"熊守美"));
        Filter filter = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS,Constant.Index.EXPERT)));
        List<Document> docs = luceneSearch.search(query,filter);
        for (Document doc : docs){
            System.out.println(doc);
        }
    }
}