/*
* Permission.java
* Created on  202015/2/5 19:44
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/2/5       panzhuo    初始版本
*
*/

package com.ccut.bits.model;

import com.ccut.bits.page.PageBase;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
public class Permission extends PageBase{

    private Integer id;
    private String permToken;
    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPermToken() {
        return permToken;
    }

    public void setPermToken(String permToken) {
        this.permToken = permToken;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
