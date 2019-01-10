package com.ccut.bits.lucene;

import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.TrackingIndexWriter;
import org.apache.lucene.search.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.File;
import java.io.IOException;

/**
 * Created by Demon on 2015/5/4.
 */
public class LuceneContext {

    private final String INDEX_PATH = "d:\\index";

    private IndexWriter writer = null;

    private SearcherManager searcherManager = null;

    private TrackingIndexWriter trackingIndexWriter = null;

    private ControlledRealTimeReopenThread<IndexSearcher> crtThread = null;

    public final Version Version = org.apache.lucene.util.Version.LUCENE_47;

    private LuceneContext() {}

    private void init() {
        try {
            File indexFile = new File(INDEX_PATH);
            if (!indexFile.exists()) {
                indexFile.mkdir();
            }
            Directory dir = FSDirectory.open(new File(INDEX_PATH));
            IndexWriterConfig writerConfig = new IndexWriterConfig(Version,new IKAnalyzer());
            writer = new IndexWriter(dir, writerConfig);
            searcherManager = new SearcherManager(writer, false, new SearcherFactory());
            trackingIndexWriter = new TrackingIndexWriter(writer);
            crtThread = new ControlledRealTimeReopenThread<>(trackingIndexWriter, searcherManager, 5.0, 0.025);
            crtThread.setDaemon(true); //设为后台进程
            crtThread.setName("lucene thread");
            crtThread.start(); //启用线程
        } catch (IOException e) {
            System.out.println("lucene容器初始化失败");
            System.out.println("错误信息:" + e.toString());
        }
        System.out.println("lucene环境已加载");

    }

    public IndexWriter getWriter() {
        return trackingIndexWriter.getIndexWriter();
    }

    public SearcherManager getSearcherManager(){
        return searcherManager;
    }

    public void indexOptimize() {
        try {
            writer.commit();
            writer.forceMerge(3);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void destroy() {
        try {
            crtThread.close();
            if (writer != null) writer.close();
            System.out.println("lucene环境正常关闭");
        } catch (IOException e) {
            System.out.println("writer关闭异常");
        }
    }

}
