package com.ccut.bits.lucene;

import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

/**
 * Created by Demon on 2015/4/3.
 */
@Component
@Lazy(false)
public class LuceneIndex {
    @Autowired
    private LuceneContext luceneContext;

    private long operatorTime = 0;

    private IndexWriter trackWriter = null;

    public LuceneIndex() {
    }

    public boolean createIndex(List<Document> docs){
        System.out.println("正在创建索引..");
        try {
            IndexWriter index= luceneContext.getWriter();
            index.addDocuments(docs);
            luceneContext.indexOptimize();
        } catch (IOException e) {
            return false;
        }
        System.out.println("索引创建完成!");
        return true;
    }

    public boolean updateIndex(Term term,List<Document> documents){
        try {
            luceneContext.getWriter().updateDocuments(term, documents);
            luceneContext.indexOptimize();
        } catch (IOException e) {
            System.out.println("更新索引失败");
            return false;
        }
        System.out.println("索引更新成功");
        return true;
    }

    public boolean deleteAllIndex(){
        try {
            luceneContext.getWriter().forceMergeDeletes();
            luceneContext.indexOptimize();
        } catch (IOException e) {
            System.out.println("索引删除失败");
            return false;
        }
        return true;
    }

    public boolean deleteIndex(Query query){
        try {
            luceneContext.getWriter().deleteDocuments(query);
            luceneContext.indexOptimize();
        } catch (IOException e) {
            return false;
        }
        return true;
    }

}
