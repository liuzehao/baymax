/*
* AutoAnswerService.java
* Created on  202015/5/17 22:22
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/5/17       panzhuowen    初始版本
*
*/

package com.ccut.bits.autoanswer.service;

import com.ccut.bits.autoanswer.model.Score;
import com.ccut.bits.autoanswer.model.Solution;
import com.ccut.bits.constant.Constant;
import com.ccut.bits.expert.dao.ExpertDao;
import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.lucene.LuceneSearch;
import com.ccut.bits.relation.ExpertRelation;
import com.ccut.bits.relation.ThemeRelation;
import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.util.MailUtil;
import com.ccut.bits.util.StringUtil;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.Filter;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.QueryWrapperFilter;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.util.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
@Service
public class AutoAnswerService {
    @Autowired
    private LuceneSearch searcher;
    @Autowired
    private ExpertDao expertDao;
    @Autowired
    private ThemeRelation themeRelation;
    @Autowired
    private ExpertRelation expertRelation;

    private MailUtil mailUtil = new MailUtil();
    private StringUtil stringUtil = new StringUtil();

    static class Result {
        public static enum TYPE {
            PATENT,
            LITERATURE
        }
    }

    public Solution getAnswer(String question) {
        Analyzer analyzer = new IKAnalyzer();
        Solution solution = new Solution();
        Score patentMaxScore = new Score(Float.NaN);
        Score literatureMaxScore = new Score(Float.NaN);
        List<Document> literatureResult = null;
        List<Document> patentResult = null;
        Result.TYPE type = null;
        //选取最优解
        Document doc = null;
        try {
            patentResult = this.getPatentSearchResult(question, analyzer, patentMaxScore);
            literatureResult = this.getLiteratureSearchResult(question, analyzer, literatureMaxScore);
            if (patentResult.isEmpty() && literatureResult.isEmpty()) {
                return solution;
            } else if (patentResult.isEmpty()) {
                doc = literatureResult.get(0);
                type = Result.TYPE.LITERATURE;
            } else if (literatureResult.isEmpty()) {
                doc = patentResult.get(0);
                type = Result.TYPE.PATENT;
            } else {
                if (patentMaxScore.getScore().compareTo(literatureMaxScore.getScore()) == 0) {
                    doc = patentResult.get(0);
                    type = Result.TYPE.PATENT;
                } else if (patentMaxScore.getScore().compareTo(literatureMaxScore.getScore()) < 0) {
                    doc = literatureResult.get(0);
                    type = Result.TYPE.LITERATURE;
                } else {
                    doc = patentResult.get(0);
                    type = Result.TYPE.PATENT;
                }
            }
        } catch (ParseException e) {
            System.out.println(e.toString());
        }
        this.fitSolutionContent(solution, doc, type);
        this.fitSolutionExpert(solution, doc, type);
        return solution;
    }

    private List<Document> getPatentSearchResult(String question, Analyzer analyzer, Score score) throws ParseException {
        String[] fields = new String[]{
                Constant.Index.Patent.FIELD_TITLE,
                Constant.Index.Patent.FIELD_ABS
        };
        Query query = new MultiFieldQueryParser(Version.LUCENE_47, fields, analyzer).parse(question);
        TermQuery filerQuery = new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.PATENT));
        Filter filter = new QueryWrapperFilter(filerQuery);
        List<Document> re = searcher.search(query, filter);
        score.setScore(searcher.getCurrentSearchMaxScore());
        return re;
    }

    private List<Document> getLiteratureSearchResult(String question, Analyzer analyzer, Score score) throws ParseException {
        String[] fields = new String[]{
                Constant.Index.Literature.FIELD_TITLE,
                Constant.Index.Literature.FIELD_ABS,
                Constant.Index.Literature.FIELD_KEY
        };
        Query query = new MultiFieldQueryParser(Version.LUCENE_47, fields, analyzer).parse(question);
        TermQuery lQuery = new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.LITERATURE));
        Filter literFilter = new QueryWrapperFilter(lQuery);
        List<Document> re = searcher.search(query, literFilter);
        score.setScore(searcher.getCurrentSearchMaxScore());
        return re;
    }

    private void fitSolutionContent(Solution solution, Document doc, Result.TYPE type) {
        if (Result.TYPE.PATENT.equals(type)) {
            String content = doc.get(Constant.Index.Patent.FIELD_ABS).trim().replace("　", "");
            String title = doc.get(Constant.Index.Patent.FIELD_TITLE).trim().replace("　", "");
            if (content.startsWith(title)) {
                solution.setContent(content);
                //代词替换
            } else if (content.startsWith("本发明") || content.startsWith("本实用新型")) {
                content = content.replaceFirst("本发明|本实用新型", title + "是");
                solution.setContent(content);
            } else {
                solution.setContent(new StringBuffer(content).insert(0, title + "是").toString());
            }
        }
        if (Result.TYPE.LITERATURE.equals(type)) {
            String title = doc.get(Constant.Index.Literature.FIELD_TITLE);
            String content = doc.get(Constant.Index.Literature.FIELD_ABS);
            solution.setContent(title + "是" + content);
        }
    }

    private void fitSolutionExpert(Solution solution, Document doc, Result.TYPE type) {
        String expertsStr = null;
        String[] names = null;
        if (Result.TYPE.PATENT.equals(type)) {
            expertsStr = doc.get(Constant.Index.Patent.FIELD_INVENTOR);
        } else if (Result.TYPE.LITERATURE.equals(type)) {
            expertsStr = doc.get(Constant.Index.Literature.FIELD_AUTHOR);
        }
        if (expertsStr == null) {
            return;
        }
        names = expertsStr.split(";");
        names = StringUtil.trimStringArray(names);
        List<Expert> experts = expertDao.getExpertByNames(names);
        for (Expert expert : experts) {
            expert.setThemeList((List<Theme>) themeRelation.getThemes(expertRelation.getThemeIds(expert.getId())));
        }
        solution.setExperts(experts);
    }

    /*public int sendMail(String email, String subject, String body, String user, String password){
        if(!stringUtil.isValidString(subject) || !stringUtil.isValidString(body)){
            return 0;       //表示标题或内容无意义！
        }else if(!mailUtil.sendEmail(email, subject, body, user, password)){
            return 1;       //表示连接时出错，确认账号密码是否正确以及smtp服务是否开启！
        }
        return 2;   //正常，邮件发送成功！
    }*/

    public boolean sendEmail(String email, String subject, String body, String user, String password){
        return mailUtil.sendEmail(email, subject, body, user, password);
    }

    public boolean isValidString(String content){
        return stringUtil.isValidString(content);
    }

}
