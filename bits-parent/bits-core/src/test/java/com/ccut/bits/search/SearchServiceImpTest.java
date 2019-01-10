package com.ccut.bits.search;

import com.ccut.bits.constant.Constant;
import com.ccut.bits.lucene.LuceneSearch;
import com.ccut.bits.util.SpringTransactionalTestCase;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.Filter;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.QueryWrapperFilter;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.util.Version;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.util.List;

import static org.junit.Assert.*;
@ContextConfiguration("/applicationContext-test.xml")
public class SearchServiceImpTest extends SpringTransactionalTestCase{
    @Autowired
    private LuceneSearch luceneSearch;

    @Test
    public void testSearchPatent() throws Exception {
        IKAnalyzer analyzer = new IKAnalyzer();
        TokenStream tokenStream = analyzer.tokenStream(Constant.Index.Literature.FIELD_TITLE, "天文学");
        tokenStream.reset();
        while (tokenStream.incrementToken()){
            CharTermAttribute charTermAttribute = tokenStream.getAttribute(CharTermAttribute.class);
            System.out.println(charTermAttribute.toString());
        }
        tokenStream.close();
//        Query query = new QueryParser(Version.LUCENE_47,Constant.Index.Patent.FIELD_TITLE,analyzer).parse("一种有机导电纤维");
        Query query = new MultiFieldQueryParser(Version.LUCENE_47,new String[]{Constant.Index.Intelligence.FIELD_TITLE},analyzer).parse("中国");
       // Filter filter = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.PATENT)));
        List<Document> re = luceneSearch.search(query);
        for (Document document:re){
            System.out.println(document.toString());
        }
    }
    @Test
    public void testSearchText() throws Exception {
        IKAnalyzer analyzer = new IKAnalyzer();
        TokenStream tokenStream = analyzer.tokenStream("content", "file");
        tokenStream.reset();
        while (tokenStream.incrementToken()){
            CharTermAttribute charTermAttribute = tokenStream.getAttribute(CharTermAttribute.class);
            System.out.println(charTermAttribute.toString());
        }
        tokenStream.close();
//        Query query = new QueryParser(Version.LUCENE_47,Constant.Index.Patent.FIELD_TITLE,analyzer).parse("一种有机导电纤维");
        Query query = new MultiFieldQueryParser(Version.LUCENE_47,new String[]{Constant.Index.Video.VIDEO__NAME,Constant.Index.Video.VIDEO__ABS,Constant.Index.Video.VIDEO__KEY},analyzer).parse("逍遥游");
        //Filter filter = new QueryWrapperFilter(new TermQuery(new Term("path")));
        List<Document> re = luceneSearch.search(query);
        for (Document document:re){
            System.out.println(document.toString());
        }
    }
}