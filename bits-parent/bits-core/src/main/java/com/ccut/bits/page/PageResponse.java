/*
* GetPage.java
* Created on  202015/2/7 14:46
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/7     panzhuowen    初始版本
*
*/

package com.ccut.bits.page;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public class PageResponse<T> {
    private Page page;
    private List<T> resultList;

    public PageResponse() {
    }

    public PageResponse(Page page, List<T> resultList) {
        this.page = page;
        this.resultList = resultList;
    }

    public Page getPage() {
        return this.page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public List<T> getResultList() {
        return this.resultList;
    }

    public void setResultList(List<T> resultList) {
        this.resultList = resultList;
    }
}
