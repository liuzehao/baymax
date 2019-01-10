/*
* Page.java
* Created on  202015/2/7 13:47
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/7     panzhuowen    初始版本
*
*/

package com.ccut.bits.page;

import com.ccut.bits.constant.Constant;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 类的描述信息
 * 分页基类
 * @author panzhuowen
 * @version 1.0.1
 */
public class Page {
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private int id;//用户id无奈之举
    private int pageSize;
    private int totalPage;
    private int totalResult;
    private int pageNo;
    private int currentResult;
    private String[] sumColumns;
    private Map<String, String> sumResult;

    public Page() {
        this.pageSize = 12;
        this.pageNo = 1;
    }

    public Page(HttpServletRequest request) {
        this(request.getParameter(Constant.Page.PAGE_SIZE), request.getParameter(Constant.Page.PAGE_NO));
    }

    public Page(String pageNo) {
        this(String.valueOf(12), pageNo);
    }

    public Page(String pageSize, String pageNo) {
        try {
            this.pageNo = Integer.parseInt(pageNo);
        } catch (NumberFormatException var5) {
            this.pageNo = 1;
        }

        try {
            this.pageSize = Integer.parseInt(pageSize);
        } catch (NumberFormatException var4) {
            this.pageSize = 12;
        }

    }

    public int getTotalPage() {
        if(this.totalResult % this.pageSize == 0) {
            this.totalPage = this.totalResult / this.pageSize;
        } else {
            this.totalPage = this.totalResult / this.pageSize + 1;
        }

        return this.totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalResult() {
        return this.totalResult;
    }

    public void setTotalResult(int totalResult) {
        this.totalResult = totalResult;
    }

    public int getPageNo() {
        if(this.pageNo <= 0) {
            this.pageNo = 1;
        }

        return this.pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrentResult() {
        this.currentResult = (this.getPageNo() - 1) * this.getPageSize();
        if(this.currentResult < 0) {
            this.currentResult = 0;
        }

        return this.currentResult;
    }

    public void setCurrentResult(int currentResult) {
        this.currentResult = currentResult;
    }

    public String[] getSumColumns() {
        return this.sumColumns;
    }

    public void setSumColumns(String[] sumColumns) {
        this.sumColumns = sumColumns;
    }

    public boolean hasSumColumns() {
        return this.sumColumns != null && this.sumColumns.length > 0;
    }

    public boolean lessThanMaxSumLimit() {
        return this.totalResult < 10000;
    }

    public Map<String, String> getSumResult() {
        return this.sumResult;
    }

    public void setSumResult(Map<String, String> sumResult) {
        this.sumResult = sumResult;
    }
}
