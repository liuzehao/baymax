package com.ccut.bits.lucene;

import com.ccut.bits.constant.Constant;
import com.ccut.bits.page.Page;
import org.apache.lucene.document.Document;
import org.apache.lucene.search.*;
import org.apache.lucene.search.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Demon on 2015/4/3.
 */
@Component
public class LuceneSearch {

    private SearcherManager searcherManager = null;
    private IndexSearcher searcher = null;
    private int totalHits = 0;
    private ScoreDoc[] scoreDocs = null;
    private Filter filter = null;
    private Sort sort = null;
    private boolean isFirstPage = false;
    private boolean isPaging = false;
    private int prevLastScoreDocIndex;
    private int querySize = 0;
    private float maxScore = 0;


    @Autowired
    public LuceneSearch(LuceneContext luceneContext) {
        searcherManager = luceneContext.getSearcherManager();
    }

    public void setPage(Page page) {
        isPaging = true;
        querySize = page.getPageSize();
        if (page.getPageNo() == Constant.Page.FIRST_PAGE) {
            isFirstPage = true;
        } else {
            prevLastScoreDocIndex = (page.getPageNo() - 1) * page.getPageSize() - 1;
        }
    }

    /*
    * 主搜索程序
     */
    public List<Document> search(Query query) {
        List<Document> docs = new LinkedList<>();
        try {
            searcher = searcherManager.acquire();
            TopDocs topDocs = null;
            if (filter != null) {
                topDocs = searcher.search(query, filter, Constant.Page.SUGGEST_QUERY_SIZE);
            } else {
                topDocs = searcher.search(query, Constant.Page.SUGGEST_QUERY_SIZE);
            }
            scoreDocs = topDocs.scoreDocs;
            totalHits = topDocs.totalHits;
            maxScore = topDocs.getMaxScore();
            if (isPaging) pagingSearch(query);
            for (ScoreDoc scoreDoc : scoreDocs) {
                docs.add(searcher.doc(scoreDoc.doc));
            }
            searcherManager.release(searcher);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return docs;
    }

    public List<Document> search(Query query, Filter filter) {
        this.filter = filter;
        return search(query);
    }

    /*
    * lucene搜索分页
     */
    private void pagingSearch(Query query) throws IOException {
        ScoreDoc lastScoreDoc = null;
        if(!isFirstPage)
            lastScoreDoc = scoreDocs[prevLastScoreDocIndex];
        if (filter != null) {
            scoreDocs = searcher.searchAfter(lastScoreDoc, query, filter, querySize).scoreDocs;
        } else {
            scoreDocs = searcher.searchAfter(lastScoreDoc, query, querySize).scoreDocs;
        }
    }

    public int getTotalHits() {
        return totalHits;
    }

    public ScoreDoc[] getScoreDocs() {
        return scoreDocs;
    }

    public float getCurrentSearchMaxScore(){
        return maxScore;
    }
}
