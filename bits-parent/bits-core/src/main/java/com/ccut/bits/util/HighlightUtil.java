package com.ccut.bits.util;

import org.apache.lucene.search.Query;
import org.apache.lucene.search.highlight.*;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.IOException;
import java.util.List;

/**
 * Created by Demon on 2015/4/19.
 */
public class HighlightUtil {
    private static String htmlBegin = "<span style='color:red'>";
    private static String htmlEnd = "</span>";
    private HighlightUtil(){};

    public static String getHighlighterString(Query query,String field,String text){
        String old = new String(text);
        String result = null;
        try {
            QueryScorer queryScorer = new QueryScorer(query,field);
            Fragmenter fragmenter = new SimpleSpanFragmenter(queryScorer);
            Formatter formatter = new SimpleHTMLFormatter(htmlBegin,htmlEnd);
            Highlighter highlighter = new Highlighter(formatter,queryScorer);
            highlighter.setTextFragmenter(fragmenter);
            result = highlighter.getBestFragment(new IKAnalyzer(),field,text);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InvalidTokenOffsetsException e) {
            System.out.println("错误信息:" + e.toString());
        }finally {
            if(result == null || "".equals(result.trim()))
                result = old;
            return result;
        }
    }

}
