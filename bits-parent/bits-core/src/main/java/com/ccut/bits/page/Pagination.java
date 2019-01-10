package com.ccut.bits.page;

import com.ccut.bits.constant.*;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Demon on 2015/4/8.
 */
public class Pagination {
    private int currentIndex;
    private int totalPage;
    private int totalRecord;
    private boolean isLastPage = false;
    private boolean isFirstPage = false;
    private String parameters;
    private final String PREFIX = "<li><a href='?pageNo=";
    private final String SUFFIX = "</a></li>";
    private final String CENTER = "'>";
    private final String ACTIVE_PREFIX = "<li><span>";
    private final String ACTIVE_SUFFIX = "</span></li>";
    private final String PREVIOUS_PAGE = "上一页";
    private final String NEXT_PAGE = "下一页";
    private int totalPagingButton = 8;
    private List<Integer> pageIndexList = new LinkedList<>();
    private List<String> pagination = new LinkedList<>();
    private final int MAX_SHOW_PAGE = 300;

    public Pagination(int pageNo,int pageSize, int totalRecord,String parameters){
        this.currentIndex = pageNo;
        this.totalRecord = (totalRecord > MAX_SHOW_PAGE? MAX_SHOW_PAGE:totalRecord);
        this.totalPage =  (this.totalRecord / pageSize) + (totalRecord % pageSize == 0? 0:1);
        this.parameters = (parameters == null? "":"&" + parameters);
        this.isFirstPage = (this.currentIndex == Constant.Page.FIRST_PAGE? Constant.YES: Constant.NO);
        this.isLastPage = (this.currentIndex == this.totalPage? Constant.YES: Constant.NO);
    }

    public Pagination(Page page,int totalRecord,String parameters){
        this(page.getPageNo(),page.getPageSize(),totalRecord,parameters);
    }

    public List<String> getPagination(){
        List<String> pagination = new LinkedList<String>();
        createPagination(pagination);
        return pagination;
    }
    private void createPagination(List<String> pagination){
        if(currentIndex <= 0 || currentIndex > totalPage)
            return;
        int cursor = 1;
        int prevIndex = currentIndex - 1;
        int nextIndex = currentIndex + 1;
        int beginIndex = ((currentIndex / totalPagingButton) * totalPagingButton) + 1;
        if(currentIndex % totalPagingButton == 0)
            beginIndex = beginIndex - totalPagingButton;
        String previous = PREFIX + prevIndex + parameters +CENTER + PREVIOUS_PAGE + SUFFIX;
        String next = PREFIX + nextIndex + parameters +CENTER + NEXT_PAGE + SUFFIX;
        if(!isFirstPage)
            pagination.add(previous);
        while(cursor <= totalPagingButton &&  beginIndex <= totalPage){
            if(beginIndex != currentIndex) {
                pagination.add(PREFIX + beginIndex + parameters + CENTER + beginIndex + SUFFIX);
            }
            else{
                pagination.add(ACTIVE_PREFIX + beginIndex + ACTIVE_SUFFIX);
            }
            beginIndex++;
            cursor++;
        }
        if(!isLastPage)
            pagination.add(next);
    }
}
