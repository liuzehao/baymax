package com.ccut.bits.userCenter.model;

import com.ccut.bits.page.PageBase;

/**
 * Created by hao pc on 2016/4/27.
 */
public class General extends PageBase {
    int fileId;
    int userId;
    String time;
    String fileType;
    String fileName;

    public String getFileDownUrl() {
        return fileDownUrl;
    }

    public void setFileDownUrl(String fileDownUrl) {
        this.fileDownUrl = fileDownUrl;
    }

    private String fileDownUrl;
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }



    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }


    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
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
