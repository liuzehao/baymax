package com.ccut.bits.search;

import com.ccut.bits.audio.model.Audio;
import com.ccut.bits.constant.Constant;
import com.ccut.bits.expert.dao.ExpertDao;
import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.intelligence.model.Intelligence;
import com.ccut.bits.literature.dao.LiteratureDao;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.lucene.LuceneSearch;
import com.ccut.bits.picture.dao.PictureDao;
import com.ccut.bits.picture.model.Picture;
import com.ccut.bits.relation.ExpertRelation;
import com.ccut.bits.relation.ThemeRelation;
import com.ccut.bits.search.model.SearchRequest;
import com.ccut.bits.search.model.SearchResponse;
import com.ccut.bits.patent.model.Patent;
import com.ccut.bits.theme.dao.ThemeDao;
import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.util.HighlightUtil;
import com.ccut.bits.util.StringUtil;
import com.ccut.bits.video.model.Video;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.util.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wltea.analyzer.dic.*;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.util.*;

/**
 * Created by Demon on 2015/4/15.
 */
@Service("searchService")
public class SearchServiceImp implements SearchService {
    @Autowired
    private LuceneSearch luceneSearch;
    @Autowired
    private ExpertRelation expertRelation;
    @Autowired
    private ThemeRelation themeRelation;
    @Autowired
    private ExpertDao expertDao;
    @Autowired
    private PictureDao PictureDao;
    @Autowired
    private LiteratureDao literatureDao;
    @Override
    public SearchResponse<Literature> searchLiterature(SearchRequest request) {
        luceneSearch.setPage(request.getPage());
        String[] fields = {
                Constant.Index.Literature.FIELD_TITLE,
                Constant.Index.Literature.FIELD_ABS,
                Constant.Index.Literature.FIELD_KEY,
                Constant.Index.Literature.FIELD_INABS
        };
        QueryParser parser = new MultiFieldQueryParser(Version.LUCENE_47, fields, new IKAnalyzer());
        Query query = null;
        try {
            query = parser.parse(request.getKey());
        } catch (ParseException e) {
            System.out.println(e.toString());
        }
        Filter filter = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.LITERATURE)));
        List<Document> docs = luceneSearch.search(query,filter);
        List<Literature> result = new LinkedList<>();
        Literature literature = null;
        for (Document doc : docs) {
            Literature a=literatureDao.getLiteratureById(Integer.parseInt(doc.get(Constant.Index.Literature.FIELD_ID)));
            literature = new Literature();
            literature.setId(Integer.parseInt(doc.get(Constant.Index.Literature.FIELD_ID)));
            literature.setTitle(doc.get(Constant.Index.Literature.FIELD_TITLE));
            literature.setAbs(doc.get(Constant.Index.Literature.FIELD_ABS));
            literature.setAppDate(doc.get(Constant.Index.Literature.FIELD_DATE));
            literature.setAuthorCn(doc.get(Constant.Index.Literature.FIELD_AUTHOR));
            literature.setJournalCn(doc.get(Constant.Index.Literature.FIELD_JOURNAL));
            literature.setFileImgUrl(a.getFileImgUrl());
            literature.setFileKeywords(a.getFileKeywords());
            result.add(literature);
        }

        for (Literature l : result) {
            String title= HighlightUtil.getHighlighterString(query, Constant.Index.Literature.FIELD_TITLE, l.getTitle());
            String abs=HighlightUtil.getHighlighterString(query, Constant.Index.Literature.FIELD_ABS, l.getAbs());
            if(title.equals(l.getTitle())&&abs.equals(l.getAbs())){
                l.setAbs("<span style=\"color:red\">"+request.getKey()+"......</span>"+l.getAbs());
            }else {
                l.setTitle(title);
                l.setAbs(abs);
            }
           // l.setAuthorCn(HighlightUtil.getHighlighterString(query, Constant.Index.Literature.FIELD_AUTHOR, l.getAuthorCn()));
        }
        return new SearchResponse<Literature>(result, luceneSearch.getTotalHits());
    }

    @Override
    public SearchResponse<Literature> searchAll(SearchRequest request) {
        luceneSearch.setPage(request.getPage());
        String[] fields = {
                Constant.Index.All.FIELD_TITLE,
                Constant.Index.All.FIELD_ABS,
                Constant.Index.All.FIELD_KEY,
                Constant.Index.All.FIELD_INABS
        };
        QueryParser parser = new MultiFieldQueryParser(Version.LUCENE_47, fields, new IKAnalyzer());
        Query query = null;
        try {
            query = parser.parse(request.getKey());
        } catch (ParseException e) {
            System.out.println(e.toString());
        }
        //Filter filter = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.LITERATURE)));
        List<Document> docs = luceneSearch.search(query);
        List<Literature> result = new LinkedList<>();
        Literature literature = null;
        for (Document doc : docs) {
            Literature a=literatureDao.getLiteratureById(Integer.parseInt(doc.get(Constant.Index.All.FIELD_ID)));
            literature = new Literature();
            literature.setId(Integer.parseInt(doc.get(Constant.Index.All.FIELD_ID)));
            literature.setTitle(doc.get(Constant.Index.All.FIELD_TITLE));
            literature.setAbs(doc.get(Constant.Index.All.FIELD_ABS));
            literature.setAppDate(doc.get(Constant.Index.All.FIELD_DATE));
            if(a!=null) {
                literature.setFileImgUrl(a.getFileImgUrl());
                literature.setFileKeywords(a.getFileKeywords());
            }
            result.add(literature);
        }

        for (Literature l : result) {
             String title= HighlightUtil.getHighlighterString(query, Constant.Index.All.FIELD_TITLE, l.getTitle());
            String abs=HighlightUtil.getHighlighterString(query, Constant.Index.All.FIELD_ABS, l.getAbs());
            if(title.equals(l.getTitle())&&abs.equals(l.getAbs())){
                l.setAbs("<span style=\"color:red\">"+request.getKey()+"......</span>"+l.getAbs());
            }else {
                l.setTitle(title);
                l.setAbs(abs);
            }
            // l.setAuthorCn(HighlightUtil.getHighlighterString(query, Constant.Index.Literature.FIELD_AUTHOR, l.getAuthorCn()));
        }
        return new SearchResponse<Literature>(result, luceneSearch.getTotalHits());
    }



    //高级搜索
    @Override
    public SearchResponse<Literature> searchAll1(SearchRequest request) {
        luceneSearch.setPage(request.getPage());
        BooleanQuery query1 = new BooleanQuery();
        //key
        if(StringUtil.notEmpty(request.getKey())&&request.getAccurate().equals("precise")  ) {
            //精确
            query1.add(new TermQuery(new Term(request.getField(),request.getKey() )), BooleanClause.Occur.MUST);
            String fuzzy = request.getFuzzy();
            int i = Integer.parseInt(fuzzy);

        }


        if(StringUtil.notEmpty(request.getKey())&&request.getAccurate().equals("fuzzy") ) {
            //模糊
            String fuzzy = request.getFuzzy();
            int i = Integer.parseInt(fuzzy);//模糊值
            if(0<=i && i<=5){
                query1.add(new FuzzyQuery(new Term(request.getField(), request.getKey()),0,6-i), BooleanClause.Occur.SHOULD);
            }
            if(6<=i && i<=10){
                query1.add(new FuzzyQuery(new Term(request.getField(), request.getKey()),1,11-i), BooleanClause.Occur.SHOULD);
            }
            if(11<=i && i<=15){
                query1.add(new FuzzyQuery(new Term(request.getField(), request.getKey()),2,16-i), BooleanClause.Occur.SHOULD);
            }
        }



        //key1
        if(StringUtil.notEmpty(request.getKey1())&& request.getJudge().equals("must") &&request.getAccurate1().equals("precise")  ) {

            query1.add(new TermQuery(new Term(request.getField1(),request.getKey1() )), BooleanClause.Occur.MUST);
        }
        if(StringUtil.notEmpty(request.getKey1())&& request.getJudge().equals("must") &&request.getAccurate1().equals("fuzzy")  ) {

            String fuzzy = request.getFuzzy();
            int i = Integer.parseInt(fuzzy);//模糊值
            if(0<=i && i<=5){
                query1.add(new FuzzyQuery(new Term(request.getField1(), request.getKey1()),0,6-i), BooleanClause.Occur.SHOULD);
            }
            if(6<=i && i<=10){
                query1.add(new FuzzyQuery(new Term(request.getField1(), request.getKey1()),1,11-i), BooleanClause.Occur.SHOULD);
            }
            if(11<=i && i<=15){
                query1.add(new FuzzyQuery(new Term(request.getField1(), request.getKey1()),2,16-i), BooleanClause.Occur.SHOULD);
            }
        }

        if(StringUtil.notEmpty(request.getKey1())&& request.getJudge().equals("notmust")) {

            query1.add(new TermQuery(new Term(request.getField1(),request.getKey1() )), BooleanClause.Occur.MUST_NOT);

        }
        if(StringUtil.notEmpty(request.getKey1())&& request.getJudge().equals("should") &&request.getAccurate1().equals("precise") ) {

            query1.add(new TermQuery(new Term(request.getField1(),request.getKey1() )), BooleanClause.Occur.SHOULD);

        }
        if(StringUtil.notEmpty(request.getKey1())&& request.getJudge().equals("should") &&request.getAccurate1().equals("fuzzy") ) {

            String fuzzy = request.getFuzzy();
            int i = Integer.parseInt(fuzzy);//模糊值
            if(0<=i && i<=5){
                query1.add(new FuzzyQuery(new Term(request.getField1(), request.getKey1()),0,6-i), BooleanClause.Occur.SHOULD);
            }
            if(6<=i && i<=10){
                query1.add(new FuzzyQuery(new Term(request.getField1(), request.getKey1()),1,11-i), BooleanClause.Occur.SHOULD);
            }
            if(11<=i && i<=15){
                query1.add(new FuzzyQuery(new Term(request.getField1(), request.getKey1()),2,16-i), BooleanClause.Occur.SHOULD);
            }

        }



        //key2
        if(StringUtil.notEmpty(request.getKey2()) && request.getJudge1().equals("must")  &&request.getAccurate2().equals("precise") ) {
            query1.add(new TermQuery(new Term(request.getField2(), request.getKey2())), BooleanClause.Occur.MUST);

        }
        if(StringUtil.notEmpty(request.getKey2()) && request.getJudge1().equals("must")  &&request.getAccurate2().equals("fuzzy") ) {
            String fuzzy = request.getFuzzy();
            int i = Integer.parseInt(fuzzy);//模糊值
            if(0<=i && i<=5){
                query1.add(new FuzzyQuery(new Term(request.getField2(), request.getKey2()),0,6-i), BooleanClause.Occur.SHOULD);
            }
            if(6<=i && i<=10){
                query1.add(new FuzzyQuery(new Term(request.getField2(), request.getKey2()),1,11-i), BooleanClause.Occur.SHOULD);
            }
            if(11<=i && i<=15){
                query1.add(new FuzzyQuery(new Term(request.getField2(), request.getKey2()),2,16-i), BooleanClause.Occur.SHOULD);
            }

        }

        if(StringUtil.notEmpty(request.getKey2())&&request.getJudge1().equals("notmust") ) {
            query1.add(new TermQuery(new Term(request.getField2(), request.getKey2())), BooleanClause.Occur.MUST_NOT);

        }

        if(StringUtil.notEmpty(request.getKey2())&&request.getJudge1().equals("should")  &&request.getAccurate2().equals("precise") ) {
            query1.add(new TermQuery(new Term(request.getField2(), request.getKey2())), BooleanClause.Occur.SHOULD);

        }
        if(StringUtil.notEmpty(request.getKey2())&&request.getJudge1().equals("should")  &&request.getAccurate2().equals("fuzzy") ) {
            String fuzzy = request.getFuzzy();
            int i = Integer.parseInt(fuzzy);//模糊值
            if(0<=i && i<=5){
                query1.add(new FuzzyQuery(new Term(request.getField2(), request.getKey2()),0,6-i), BooleanClause.Occur.SHOULD);
            }
            if(6<=i && i<=10){
                query1.add(new FuzzyQuery(new Term(request.getField2(), request.getKey2()),1,11-i), BooleanClause.Occur.SHOULD);
            }
            if(11<=i && i<=15){
                query1.add(new FuzzyQuery(new Term(request.getField2(), request.getKey2()),2,16-i), BooleanClause.Occur.SHOULD);
            }

        }

        //key3
        if(StringUtil.notEmpty(request.getKey3()) && request.getJudge2().equals("must")  &&request.getAccurate3().equals("precise") ) {
            query1.add(new TermQuery(new Term(request.getField3(), request.getKey3())), BooleanClause.Occur.MUST);

        }
        if(StringUtil.notEmpty(request.getKey3()) && request.getJudge2().equals("must")  &&request.getAccurate3().equals("fuzzy") ) {
            String fuzzy = request.getFuzzy();
            int i = Integer.parseInt(fuzzy);//模糊值
            if(0<=i && i<=5){
                query1.add(new FuzzyQuery(new Term(request.getField3(), request.getKey3()),0,6-i), BooleanClause.Occur.SHOULD);
            }
            if(6<=i && i<=10){
                query1.add(new FuzzyQuery(new Term(request.getField3(), request.getKey3()),1,11-i), BooleanClause.Occur.SHOULD);
            }
            if(11<=i && i<=15){
                query1.add(new FuzzyQuery(new Term(request.getField3(), request.getKey3()),2,16-i), BooleanClause.Occur.SHOULD);
            }

        }

        if(StringUtil.notEmpty(request.getKey3())&&request.getJudge2().equals("notmust") ) {
            query1.add(new TermQuery(new Term(request.getField3(), request.getKey3())), BooleanClause.Occur.MUST_NOT);

        }

        if(StringUtil.notEmpty(request.getKey3())&&request.getJudge2().equals("should")  &&request.getAccurate3().equals("precise") ) {
            query1.add(new TermQuery(new Term(request.getField3(), request.getKey3())), BooleanClause.Occur.SHOULD);

        }
        if(StringUtil.notEmpty(request.getKey3())&&request.getJudge2().equals("should")  &&request.getAccurate3().equals("fuzzy") ) {
            String fuzzy = request.getFuzzy();
            int i = Integer.parseInt(fuzzy);//模糊值
            if(0<=i && i<=5){
                query1.add(new FuzzyQuery(new Term(request.getField3(), request.getKey3()),0,6-i), BooleanClause.Occur.SHOULD);
            }
            if(6<=i && i<=10){
                query1.add(new FuzzyQuery(new Term(request.getField3(), request.getKey3()),1,11-i), BooleanClause.Occur.SHOULD);
            }
            if(11<=i && i<=15){
                query1.add(new FuzzyQuery(new Term(request.getField3(), request.getKey3()),2,16-i), BooleanClause.Occur.SHOULD);
            }

        }

        //key4
        if(StringUtil.notEmpty(request.getKey4()) && request.getJudge3().equals("must")  &&request.getAccurate4().equals("precise") ) {
            query1.add(new TermQuery(new Term(request.getField4(), request.getKey4())), BooleanClause.Occur.MUST);

        }
        if(StringUtil.notEmpty(request.getKey4()) && request.getJudge3().equals("must")  &&request.getAccurate4().equals("fuzzy") ) {
            String fuzzy = request.getFuzzy();
            int i = Integer.parseInt(fuzzy);//模糊值
            if(0<=i && i<=5){
                query1.add(new FuzzyQuery(new Term(request.getField4(), request.getKey4()),0,6-i), BooleanClause.Occur.SHOULD);
            }
            if(6<=i && i<=10){
                query1.add(new FuzzyQuery(new Term(request.getField4(), request.getKey4()),1,11-i), BooleanClause.Occur.SHOULD);
            }
            if(11<=i && i<=15){
                query1.add(new FuzzyQuery(new Term(request.getField4(), request.getKey4()),2,16-i), BooleanClause.Occur.SHOULD);
            }

        }

        if(StringUtil.notEmpty(request.getKey4())&&request.getJudge3().equals("notmust") ) {
            query1.add(new TermQuery(new Term(request.getField4(), request.getKey4())), BooleanClause.Occur.MUST_NOT);

        }

        if(StringUtil.notEmpty(request.getKey4())&&request.getJudge3().equals("should")  &&request.getAccurate4().equals("precise") ) {
            query1.add(new TermQuery(new Term(request.getField4(), request.getKey4())), BooleanClause.Occur.SHOULD);

        }
        if(StringUtil.notEmpty(request.getKey4())&&request.getJudge3().equals("should")  &&request.getAccurate4().equals("fuzzy") ) {
            String fuzzy = request.getFuzzy();
            int i = Integer.parseInt(fuzzy);//模糊值
            if(0<=i && i<=5){
                query1.add(new FuzzyQuery(new Term(request.getField4(), request.getKey4()),0,6-i), BooleanClause.Occur.SHOULD);
            }
            if(6<=i && i<=10){
                query1.add(new FuzzyQuery(new Term(request.getField4(), request.getKey4()),1,11-i), BooleanClause.Occur.SHOULD);
            }
            if(11<=i && i<=15){
                query1.add(new FuzzyQuery(new Term(request.getField4(), request.getKey4()),2,16-i), BooleanClause.Occur.SHOULD);
            }

        }

        //key5
        if(StringUtil.notEmpty(request.getKey5()) && request.getJudge4().equals("must")  &&request.getAccurate5().equals("precise") ) {
            query1.add(new TermQuery(new Term(request.getField5(), request.getKey5())), BooleanClause.Occur.MUST);

        }
        if(StringUtil.notEmpty(request.getKey5()) && request.getJudge4().equals("must")  &&request.getAccurate5().equals("fuzzy") ) {
            String fuzzy = request.getFuzzy();
            int i = Integer.parseInt(fuzzy);//模糊值
            if(0<=i && i<=5){
                query1.add(new FuzzyQuery(new Term(request.getField5(), request.getKey5()),0,6-i), BooleanClause.Occur.SHOULD);
            }
            if(6<=i && i<=10){
                query1.add(new FuzzyQuery(new Term(request.getField5(), request.getKey5()),1,11-i), BooleanClause.Occur.SHOULD);
            }
            if(11<=i && i<=15){
                query1.add(new FuzzyQuery(new Term(request.getField5(), request.getKey5()),2,16-i), BooleanClause.Occur.SHOULD);
            }

        }

        if(StringUtil.notEmpty(request.getKey5())&&request.getJudge4().equals("notmust") ) {
            query1.add(new TermQuery(new Term(request.getField5(), request.getKey5())), BooleanClause.Occur.MUST_NOT);

        }

        if(StringUtil.notEmpty(request.getKey5())&&request.getJudge4().equals("should")  &&request.getAccurate5().equals("precise") ) {
            query1.add(new TermQuery(new Term(request.getField5(), request.getKey5())), BooleanClause.Occur.SHOULD);

        }
        if(StringUtil.notEmpty(request.getKey5())&&request.getJudge4().equals("should")  &&request.getAccurate5().equals("fuzzy") ) {
            String fuzzy = request.getFuzzy();
            int i = Integer.parseInt(fuzzy);//模糊值
            if(0<=i && i<=5){
                query1.add(new FuzzyQuery(new Term(request.getField5(), request.getKey5()),0,6-i), BooleanClause.Occur.SHOULD);
            }
            if(6<=i && i<=10){
                query1.add(new FuzzyQuery(new Term(request.getField5(), request.getKey5()),1,11-i), BooleanClause.Occur.SHOULD);
            }
            if(11<=i && i<=15){
                query1.add(new FuzzyQuery(new Term(request.getField5(), request.getKey5()),2,16-i), BooleanClause.Occur.SHOULD);
            }

        }



        //搜索时间
        if( request.getYear().equals("no") && request.getYear1().equals("no")) {
            query1.add(TermRangeQuery.newStringRange(Constant.Index.All.FIELD_DATE,"0000", "9999", true, true), BooleanClause.Occur.MUST);
        } else if(request.getYear().equals("no") && (request.getYear1().equals("no")==false))
        {
            query1.add(TermRangeQuery.newStringRange(Constant.Index.All.FIELD_DATE,"0000", request.getYear1(), true, true), BooleanClause.Occur.MUST);
        } else if((request.getYear().equals("no")==false) && request.getYear1().equals("no")){
            query1.add(TermRangeQuery.newStringRange(Constant.Index.All.FIELD_DATE, request.getYear(), "9999", true, true), BooleanClause.Occur.MUST);
        } else {
            query1.add(TermRangeQuery.newStringRange(Constant.Index.All.FIELD_DATE, request.getYear(),  request.getYear1(), true, true), BooleanClause.Occur.MUST);
        }


        List<Document> docs = luceneSearch.search(query1);
        List<Literature> result = new LinkedList<>();
        Literature literature = null;

        for (Document doc : docs) {

            Literature a=literatureDao.getLiteratureById(Integer.parseInt(doc.get(Constant.Index.All.FIELD_ID)));

            literature = new Literature();

            literature.setId(Integer.parseInt(doc.get(Constant.Index.All.FIELD_ID)));

            literature.setTitle(doc.get(Constant.Index.All.FIELD_TITLE));

            literature.setAbs(doc.get(Constant.Index.All.FIELD_ABS));

            literature.setAppDate(doc.get(Constant.Index.All.FIELD_DATE));

            literature.setFileImgUrl(a.getFileImgUrl());

            literature.setFileKeywords(a.getFileKeywords());

            result.add(literature);
        }

        for (Literature l : result) {
           // l.setTitle(HighlightUtil.getHighlighterString(query1,Constant.Index.All.FIELD_TITLE, l.getTitle()));
            //l.setAbs(HighlightUtil.getHighlighterString(query1, Constant.Index.All.FIELD_ABS, l.getAbs()));
            l.setFileKeywords(HighlightUtil.getHighlighterString(query1, Constant.Index.All.FIELD_KEY, l.getFileKeywords()));
            l.setAppDate(HighlightUtil.getHighlighterString(query1, Constant.Index.All.FIELD_DATE, l.getAppDate()));

            String title= HighlightUtil.getHighlighterString(query1, Constant.Index.All.FIELD_TITLE, l.getTitle());
            String abs=HighlightUtil.getHighlighterString(query1, Constant.Index.All.FIELD_ABS, l.getAbs());
            if(title.equals(l.getTitle())&&abs.equals(l.getAbs())){
                l.setAbs("<span style=\"color:red\">"+request.getKey()+"......</span>"+l.getAbs());
            }else {
                l.setTitle(title);
                l.setAbs(abs);
            }
            // l.setAuthorCn(HighlightUtil.getHighlighterString(query, Constant.Index.Literature.FIELD_AUTHOR, l.getAuthorCn()));
        }
        return new SearchResponse<Literature>(result, luceneSearch.getTotalHits());
    }

    @Override
    public SearchResponse<Expert> searchExpert(SearchRequest request) {
        luceneSearch.setPage(request.getPage());
        Query query = null;
        try {
            query = new QueryParser(Version.LUCENE_47,request.getField(),new IKAnalyzer()).parse(request.getKey());
        } catch (ParseException e) {
            System.out.println(e.toString());
        }
        Filter filter = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.EXPERT)));
        List<Document> docs = luceneSearch.search(query, filter);

        List<Expert> result = new LinkedList<>();
        Expert expert = null;
        List<Integer> themeIds;
        for (Document doc : docs) {
            expert = expertDao.getExpertById(Integer.parseInt(doc.get(Constant.Index.Expert.FIELD_ID)));
            themeIds = new LinkedList<>();
            themeIds.addAll(expertRelation.getThemeIds(expert.getId()));
            expert.setThemeList((List<Theme>) themeRelation.getThemes(themeIds));
            result.add(expert);
        }
        switch (request.getField()) {
            case Constant.Index.Expert.FIELD_NAME:
                for (Expert e : result) {
                    e.setExpertName(HighlightUtil.getHighlighterString(query, Constant.Index.Expert.FIELD_NAME, e.getExpertName()));
                }
                break;
            case Constant.Index.Expert.FIELD_ORGANIZATION:
                for (Expert e : result) {
                    e.setExpertOrg(HighlightUtil.getHighlighterString(query, Constant.Index.Expert.FIELD_ORGANIZATION, e.getExpertOrg()));
                }
                break;
        }
        return new SearchResponse<Expert>(result, luceneSearch.getTotalHits());
    }

    @Override
    public SearchResponse<Patent> searchPatent(SearchRequest request) {
        luceneSearch.setPage(request.getPage());
        String[] fields = {
                Constant.Index.Patent.FIELD_TITLE,
                Constant.Index.Patent.FIELD_ABS,
        };
        Query query = null;
        try {
            query = new MultiFieldQueryParser(Version.LUCENE_47, fields, new IKAnalyzer()).parse(request.getKey());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Filter filter = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.PATENT)));

        List<Document> docs = luceneSearch.search(query, filter);

        List<Patent> result = new LinkedList<>();
        Patent patent = null;
        for (Document doc : docs) {
            patent = new Patent();
            patent.setId(Integer.parseInt(doc.get(Constant.Index.Patent.FIELD_ID)));
            patent.setAbs(doc.get(Constant.Index.Patent.FIELD_ABS));
            patent.setInventor(doc.get(Constant.Index.Patent.FIELD_INVENTOR));
            patent.setApplicant(doc.get(Constant.Index.Patent.FIELD_APPLICANT));
            patent.setTitle(doc.get(Constant.Index.Patent.FIELD_TITLE));
            patent.setDate(doc.get(Constant.Index.Patent.FIELD_DATE));
            result.add(patent);
        }

        for (Patent p : result) {
            p.setTitle(HighlightUtil.getHighlighterString(query, Constant.Index.Patent.FIELD_TITLE, p.getTitle()));
            p.setAbs(HighlightUtil.getHighlighterString(query, Constant.Index.Patent.FIELD_ABS, p.getAbs()));
        }

        return new SearchResponse<Patent>(result, luceneSearch.getTotalHits());
    }

    @Override
    public SearchResponse<Intelligence> searchGlobal(SearchRequest request) {
        luceneSearch.setPage(request.getPage());
        String[] fields = new String[]{Constant.Index.Intelligence.FIELD_TITLE, Constant.Index.Intelligence.FIELD_ABS};
        Query query = null;
        try {
            query = new MultiFieldQueryParser(Version.LUCENE_47, fields, new IKAnalyzer()).parse(request.getKey());
        } catch (ParseException e) {
            System.out.println(e.toString());
        }
        Filter filter = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.INTELLIGENCE)));
        List<Document> docs = luceneSearch.search(query, filter);
        List<Intelligence> result = new LinkedList<>();
        Intelligence intel = null;
        for (Document doc : docs) {
            intel = new Intelligence();
            intel.setTitle(doc.get(Constant.Index.Intelligence.FIELD_TITLE));
            intel.setUrl(doc.get(Constant.Index.Intelligence.FIELD_URL));
            intel.setAbs(doc.get(Constant.Index.Intelligence.FIELD_ABS));
            intel.setDate(doc.get(Constant.Index.Intelligence.FIELD_DATE));
            result.add(intel);
        }

        for (Intelligence i : result) {
            i.setTitle(HighlightUtil.getHighlighterString(query, fields[0], i.getTitle()));
            i.setAbs(HighlightUtil.getHighlighterString(query, fields[1], i.getAbs()));
        }
        return new SearchResponse<Intelligence>(result, luceneSearch.getTotalHits());
    }
    @Override
    public SearchResponse<Picture> searchPicture(SearchRequest request) {
        luceneSearch.setPage(request.getPage());
        String[] fields = {
                Constant.Index.Picture.PICTURE_NAME,
                Constant.Index.Picture.PICTURE_ABS,
                Constant.Index.Picture.PICTURE_KEY
        };
        QueryParser parser = new MultiFieldQueryParser(Version.LUCENE_47, fields, new IKAnalyzer());
        Query query = null;
        try {
            query = parser.parse(request.getKey());
        } catch (ParseException e) {
            System.out.println(e.toString());
        }
       // Filter filter = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.PICTURE)));
        List<Document> docs = luceneSearch.search(query);
        List<Picture> result = new LinkedList<>();
        Picture picture = null;
        for (Document doc : docs) {
            picture = new Picture();
            picture.setFileKeywords(doc.get(Constant.Index.Picture.PICTURE_KEY));
            picture.setFileName(doc.get(Constant.Index.Picture.PICTURE_NAME));
            picture.setFileId(Integer.parseInt(doc.get(Constant.Index.Picture.PICTURE_ID)));
            picture.setFileAbstract(doc.get(Constant.Index.Picture.PICTURE_ABS));
            picture.setFileTime(doc.get(Constant.Index.Picture.PICTURE_DATE));
            picture.setFileSize(doc.get(Constant.Index.Picture.PICTURE_SIZE));
            picture.setFileType(doc.get(Constant.Index.Picture.PICTURE_TYPE));
            result.add(picture);
        }

        for (Picture p : result) {
           // p.setFileName(HighlightUtil.getHighlighterString(query, Constant.Index.Picture.PICTURE_NAME, p.getFileName()));
            // p.setPictureName(HighlightUtil.getHighlighterString(query, Constant.Index.Picture.PICTURE_NAME, p.getPictureName()));
            //p.setFileAbstract(HighlightUtil.getHighlighterString(query, Constant.Index.Picture.PICTURE_ABS, p.getFileAbstract()));
            //  p.setPictureAuthor(HighlightUtil.getHighlighterString(query, Constant.Index.Picture.PICTURE_AUTHOR, p.getPictureAuthor()));


        }
        return new SearchResponse<Picture>(result, luceneSearch.getTotalHits());
    }
    @Override
    public SearchResponse<Video> searchVideo(SearchRequest request) {
        luceneSearch.setPage(request.getPage());
        String[] fields = {
                Constant.Index.Video.VIDEO__NAME,
                Constant.Index.Video.VIDEO__ABS,
                Constant.Index.Video.VIDEO__KEY
        };
        QueryParser parser = new MultiFieldQueryParser(Version.LUCENE_47, fields, new IKAnalyzer());
        Query query = null;
        try {
            query = parser.parse(request.getKey());
        } catch (ParseException e) {
            System.out.println(e.toString());
        }
        // Filter filter = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.PICTURE)));
        List<Document> docs = luceneSearch.search(query);
        List<Video> result = new LinkedList<>();
        Video video = null;
        for (Document doc : docs) {
             video = new Video();
            // picture.getFileKeywords(doc.get(Constant.Index.Picture.PICTURE_KEY));
            video.setFileImgUrl(doc.get(Constant.Index.Video.VIDEO__IMGURL));
            video.setFileName(doc.get( Constant.Index.Video.VIDEO__NAME));
            video.setFileId(Integer.parseInt(doc.get(Constant.Index.Video.VIDEO_ID)));
            video.setFileAbstract(doc.get(Constant.Index.Video.VIDEO__ABS));
            video.setFileTime(doc.get(Constant.Index.Video.VIDEO__DATE));
            result.add(video);
        }

        for (Video p : result) {
            p.setFileName(HighlightUtil.getHighlighterString(query, Constant.Index.Video.VIDEO__IMGURL, p.getFileName()));
            // p.setPictureName(HighlightUtil.getHighlighterString(query, Constant.Index.Picture.PICTURE_NAME, p.getPictureName()));
            p.setFileAbstract(HighlightUtil.getHighlighterString(query, Constant.Index.Video.VIDEO__ABS, p.getFileAbstract()));
            //  p.setPictureAuthor(HighlightUtil.getHighlighterString(query, Constant.Index.Picture.PICTURE_AUTHOR, p.getPictureAuthor()));


        }
        return new SearchResponse<Video>(result, luceneSearch.getTotalHits());
    }
    @Override
    public SearchResponse<Audio> searchAudio(SearchRequest request) {
        luceneSearch.setPage(request.getPage());
        String[] fields = {
                Constant.Index.Audio.AUDIO_NAME,
                Constant.Index.Audio.AUDIO__ABS,
                Constant.Index.Audio.AUDIO_KEY
        };
        QueryParser parser = new MultiFieldQueryParser(Version.LUCENE_47, fields, new IKAnalyzer());
        Query query = null;
        try {
            query = parser.parse(request.getKey());
        } catch (ParseException e) {
            System.out.println(e.toString());
        }
        // Filter filter = new QueryWrapperFilter(new TermQuery(new Term(Constant.Index.CLASS, Constant.Index.PICTURE)));
        List<Document> docs = luceneSearch.search(query);
        List<Audio> result = new LinkedList<>();
        Audio audio = null;
        for (Document doc : docs) {
            audio = new Audio();
            // picture.getFileKeywords(doc.get(Constant.Index.Picture.PICTURE_KEY));
            audio.setFileImgUrl(doc.get(Constant.Index.Audio.AUDIO__IMGURL));
            audio.setFileName(doc.get(Constant.Index.Audio.AUDIO_NAME));
            audio.setFileNameFormer(doc.get( Constant.Index.Audio.AUDIO_NAME));//未高亮的名称
            audio.setFileId(Integer.parseInt(doc.get(Constant.Index.Audio.AUDIO_ID)));
            audio.setFileAbstract(doc.get(Constant.Index.Audio.AUDIO__ABS));
            audio.setFileTime(doc.get(Constant.Index.Audio.AUDIO__DATE));
            result.add(audio);
        }

        for (Audio p : result) {
            p.setFileName(HighlightUtil.getHighlighterString(query, Constant.Index.Audio.AUDIO_NAME, p.getFileName()));
            // p.setPictureName(HighlightUtil.getHighlighterString(query, Constant.Index.Picture.PICTURE_NAME, p.getPictureName()));
            p.setFileAbstract(HighlightUtil.getHighlighterString(query, Constant.Index.Audio.AUDIO__ABS, p.getFileAbstract()));
            //  p.setPictureAuthor(HighlightUtil.getHighlighterString(query, Constant.Index.Picture.PICTURE_AUTHOR, p.getPictureAuthor()));


        }
        return new SearchResponse<Audio>(result, luceneSearch.getTotalHits());
    }
}
