package com.ccut.bits.search.model;

import com.ccut.bits.constant.Constant;
import com.ccut.bits.page.Page;
import com.ccut.bits.util.PageUtil;
import com.ccut.bits.util.StringUtil;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Demon on 2015/4/12.
 */
/*
public class SearchRequest {
    private String key;
    private String field;
    private String[] fields;
    private String direction;
    private Page page;
    private boolean isBlank = false;
    private static final String FIELD = "field";
    private static final String KEY = "key";
    private static final String DIRECTION = "direction";


    public SearchRequest(HttpServletRequest request){
        String key = request.getParameter(KEY);
        String field = request.getParameter(FIELD);
        String direction = request.getParameter(DIRECTION);
        if(StringUtil.isEmpty(key) || StringUtil.isEmpty(direction)) {
            isBlank = true;
            return;
        }
        this.key = PageUtil.encoding(key, Constant.Page.ISO_8859_1, Constant.Page.UTF_8);
        this.field = field;
        this.direction = direction;
        this.page = new Page(request);
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String[] getFields() {
        return fields;
    }

    public void setFields(String[] fields) {
        this.fields = fields;
    }

    public String getDirection(){
        return direction;
    }

    public void setDirection(String direction){
        this.direction = direction;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public boolean isValid(){
        return isBlank;
    }
}
*/
public class SearchRequest {
    //搜索内容
    private String key;
    private String key1;
    private String key2;
    private String key3;
    private String key4;
    private String key5;
    //搜索类型
    private String field;
    private String field1;
    private String field2;
    private String field3;
    private String field4;
    private String field5;
    //搜索判断
    private String judge;
    private String judge1;
    private String judge2;
    private String judge3;
    private String judge4;

    //精确判断
    private String accurate;
    private String accurate1;
    private String accurate2;
    private String accurate3;
    private String accurate4;
    private String accurate5;
    //搜索日期
    private String year;
    private String year1;
    //精确度
    private String fuzzy;
    private String fuzzy1;



    private String[] fields;
    private String direction;
    private Page page;
    private boolean isBlank = false;
    //时间
    private static final String YEAR = "year";
    private  static final String YEAR1 = "year1";


    //精确
    private static final String ACCURATE = "accurate";
    private static final String ACCURATE1 = "accurate1";
    private static final String ACCURATE2 = "accurate2";
    private static final String ACCURATE3 = "accurate3";
    private static final String ACCURATE4 = "accurate4";
    private static final String ACCURATE5 = "accurate5";

    //领域
    private static final String FIELD = "field";
    private static final String FIELD1 = "field1";
    private static final String FIELD2 = "field2";
    private static final String FIELD3 = "field3";
    private static final String FIELD4 = "field4";
    private static final String FIELD5 = "field5";

    //判断
    private static final String JUDGE = "judge";
    private static final String JUDGE1 = "judge1";
    private static final String JUDGE2 = "judge2";
    private static final String JUDGE3 = "judge3";
    private static final String JUDGE4 = "judge4";

    //输入内容
    private static final String KEY = "key";
    private static final String KEY1 = "key1";
    private static final String KEY2 = "key2";
    private static final String KEY3 = "key3";
    private static final String KEY4 = "key4";
    private static final String KEY5 = "key5";

    //模糊度
    private static final  String FUZZY = "fuzzy";
    private static final  String  FUZZY1 = "fuzzy1";

    private static final String DIRECTION = "direction";


    public SearchRequest(HttpServletRequest request){
        //内容
        String key = request.getParameter(KEY);
        String key1 = request.getParameter(KEY1);
        String key2 = request.getParameter(KEY2);
        String key3 = request.getParameter(KEY3);
        String key4 = request.getParameter(KEY4);
        String key5 = request.getParameter(KEY5);
        //领域
        String field = request.getParameter(FIELD);
        String field1 = request.getParameter(FIELD1);
        String field2 = request.getParameter(FIELD2);
        String field3 = request.getParameter(FIELD3);
        String field4 = request.getParameter(FIELD4);
        String field5 = request.getParameter(FIELD5);
        //判断
        String judge = request.getParameter(JUDGE);
        String judge1 = request.getParameter(JUDGE1);
        String judge2 = request.getParameter(JUDGE2);
        String judge3 = request.getParameter(JUDGE3);
        String judge4 = request.getParameter(JUDGE4);
        //精确
        String accurate = request.getParameter(ACCURATE);
        String accurate1 = request.getParameter(ACCURATE1);
        String accurate2 = request.getParameter(ACCURATE2);
        String accurate3 = request.getParameter(ACCURATE3);
        String accurate4 = request.getParameter(ACCURATE4);
        String accurate5 = request.getParameter(ACCURATE5);
        //时间
        String year = request.getParameter(YEAR);
        String year1 = request.getParameter(YEAR1);
        //模糊
        String fuzzy = request.getParameter(FUZZY);
        String fuzzy1 = request.getParameter(FUZZY1);



        String direction = request.getParameter(DIRECTION);
        if(StringUtil.isEmpty(key)&&StringUtil.isEmpty(key1)&&StringUtil.isEmpty(key2)&&StringUtil.isEmpty(key3)&&StringUtil.isEmpty(key4)&&StringUtil.isEmpty(key5)&&StringUtil.isEmpty(year)&&StringUtil.isEmpty(year1)||StringUtil.isEmpty(direction)) {
            isBlank = true;
            return;
        }
        //内容
        this.key = PageUtil.encoding(key, Constant.Page.ISO_8859_1, Constant.Page.UTF_8);
        this.key1 = PageUtil.encoding(key1, Constant.Page.ISO_8859_1, Constant.Page.UTF_8);
        this.key2 = PageUtil.encoding(key2, Constant.Page.ISO_8859_1, Constant.Page.UTF_8);
        this.key3 = PageUtil.encoding(key3, Constant.Page.ISO_8859_1, Constant.Page.UTF_8);
        this.key4 = PageUtil.encoding(key4, Constant.Page.ISO_8859_1, Constant.Page.UTF_8);
        this.key5 = PageUtil.encoding(key5, Constant.Page.ISO_8859_1, Constant.Page.UTF_8);
        //领域
        this.field = field;
        this.field1 = field1;
        this.field2 = field2;
        this.field3 = field3;
        this.field4 = field4;
        this.field5 = field5;
        //判断
        this.judge = judge;
        this.judge1 = judge1;
        this.judge2 = judge2;
        this.judge3 = judge3;
        this.judge4 = judge4;
        //精确
        this.accurate = accurate;
        this.accurate1 = accurate1;
        this.accurate2 = accurate2;
        this.accurate3 = accurate3;
        this.accurate4 = accurate4;
        this.accurate5 = accurate5;
        //日期
        this.year = year;
        this.year1 = year1;
        //精确度
        this.fuzzy = fuzzy;
        this.fuzzy1 = fuzzy1;



        this.direction = direction;
        this.page = new Page(request);

    }

    public String getKey5() {
        return key5;
    }

    public void setKey5(String key5) {
        this.key5 = key5;
    }

    public String getField3() {
        return field3;
    }

    public void setField3(String field3) {
        this.field3 = field3;
    }

    public String getField4() {
        return field4;
    }

    public void setField4(String field4) {
        this.field4 = field4;
    }

    public String getField5() {
        return field5;
    }

    public void setField5(String field5) {
        this.field5 = field5;
    }

    public String getJudge2() {
        return judge2;
    }

    public void setJudge2(String judge2) {
        this.judge2 = judge2;
    }

    public String getJudge3() {
        return judge3;
    }

    public void setJudge3(String judge3) {
        this.judge3 = judge3;
    }

    public String getJudge4() {
        return judge4;
    }

    public void setJudge4(String judge4) {
        this.judge4 = judge4;
    }

    public String getAccurate3() {
        return accurate3;
    }

    public void setAccurate3(String accurate3) {
        this.accurate3 = accurate3;
    }

    public String getAccurate4() {
        return accurate4;
    }

    public void setAccurate4(String accurate4) {
        this.accurate4 = accurate4;
    }

    public String getAccurate5() {
        return accurate5;
    }

    public void setAccurate5(String accurate5) {
        this.accurate5 = accurate5;
    }

    public String getFuzzy() {
        return fuzzy;
    }

    public void setFuzzy(String fuzzy) {
        this.fuzzy = fuzzy;
    }

    public String getFuzzy1() {
        return fuzzy1;
    }

    public void setFuzzy1(String fuzzy1) {
        this.fuzzy1 = fuzzy1;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getYear1() {
        return year1;
    }

    public void setYear1(String year1) {
        this.year1 = year1;
    }

    public String getAccurate() {
        return accurate;
    }

    public void setAccurate(String accurate) {
        this.accurate = accurate;
    }

    public String getAccurate1() {
        return accurate1;
    }

    public void setAccurate1(String accurate1) {
        this.accurate1 = accurate1;
    }

    public String getAccurate2() {
        return accurate2;
    }

    public void setAccurate2(String accurate2) {
        this.accurate2 = accurate2;
    }

    public String getField1() {
        return field1;
    }

    public void setField1(String field1) {
        this.field1 = field1;
    }

    public String getField2() {
        return field2;
    }

    public void setField2(String field2) {
        this.field2 = field2;
    }

    public String getJudge() {
        return judge;
    }

    public void setJudge(String judge) {
        this.judge = judge;
    }

    public String getJudge1() {
        return judge1;
    }

    public void setJudge1(String judge1) {
        this.judge1 = judge1;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getKey1() {
        return key1;
    }

    public void setKey1(String key1) {
        this.key1 = key1;
    }

    public String getKey2() {
        return key2;
    }

    public void setKey2(String key2) {
        this.key2 = key2;
    }

    public String getKey3() {
        return key3;
    }

    public void setKey3(String key3) {
        this.key3 = key3;
    }

    public String getKey4() {
        return key4;
    }

    public void setKey4(String key4) {
        this.key4 = key4;
    }




    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String[] getFields() {
        return fields;
    }

    public void setFields(String[] fields) {
        this.fields = fields;
    }

    public String getDirection(){
        return direction;
    }

    public void setDirection(String direction){
        this.direction = direction;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public boolean isValid(){
        return isBlank;
    }
}
