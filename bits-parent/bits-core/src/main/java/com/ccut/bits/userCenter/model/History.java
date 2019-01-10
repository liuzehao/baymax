package com.ccut.bits.userCenter.model;

import com.ccut.bits.expert.model.Expert;
import com.ccut.bits.page.PageBase;
import com.ccut.bits.theme.model.Theme;

/**
 * 类的描述信息
 *
 * @author longshihui
 * @version 1.0.1
 */
public class History extends PageBase {
    private int id;
    private int userId;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    private String fileName;
    public String getFileDownUrl() {
        return fileDownUrl;
    }

    public void setFileDownUrl(String fileDownUrl) {
        this.fileDownUrl = fileDownUrl;
    }

    private String fileDownUrl;
    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    private int fileId;
    private String time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}