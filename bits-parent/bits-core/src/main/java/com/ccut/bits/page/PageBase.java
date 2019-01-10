/*
* PageBase.java
* Created on  202015/2/7 14:43
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/7     panzhuowen    初始版本
*
*/

package com.ccut.bits.page;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public class PageBase implements Cloneable {
    private Page page;
    private String sortField;
    private String sortOrder;

    public PageBase() {
    }

    public Page getPage() {
        return this.page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public String getSortField() {
        return this.sortField;
    }

    public void setSortField(String sortField) {
        this.setSortField(sortField, "");
    }

    public void setSortField(String sortField, String defaultStr) {
        if(sortField != null && !sortField.equals("") && !sortField.equals("null")) {
            this.sortField = " ORDER BY " + (sortField.endsWith("IsNum")?sortField.substring(0, sortField.lastIndexOf("IsNum")):" CONVERT(" + sortField + " USING gbk)");
        } else {
            this.sortField = defaultStr;
        }

    }

    public void setDefaultSortSql(String sortSql) {
        if(this.sortField == null || this.sortField.equals("")) {
            this.sortField = sortSql;
            this.sortOrder = "";
        }

    }

    public String getSortOrder() {
        return this.sortOrder;
    }

    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder != null && !sortOrder.equals("null")?sortOrder:"";
    }

}
