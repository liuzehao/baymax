package com.ccut.bits.picture.model;
import com.ccut.bits.literature.model.Literature;
import com.ccut.bits.page.PageBase;

import java.util.List;

/**
 * Created by SunJQ on 2016/4/26.
 */
public class Picture extends PageBase{
    int fileId;
    int fileUniqueId;
    String fileName;
    String fileType;
    String fileAbstract;
    String fileTime;
    String typeGeneral;
    int fileVisit;
    int fileDown;
    String fileurl;
    int userId;
    int rankId;
    String fileKeywords;
    String fileSize;
    String fileImgUrl;

    public List<Literature> getRelations() {
        return relations;
    }

    public void setRelations(List<Literature> relations) {
        this.relations = relations;
    }

    List<Literature> relations;
    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    public int getFileUniqueId() {
        return fileUniqueId;
    }

    public void setFileUniqueId(int fileUniqueId) {
        this.fileUniqueId = fileUniqueId;
    }

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

    public String getFileAbstract() {
        return fileAbstract;
    }

    public void setFileAbstract(String fileAbstract) {
        this.fileAbstract = fileAbstract;
    }

    public String getFileTime() {
        return fileTime;
    }

    public void setFileTime(String fileTime) {
        this.fileTime = fileTime;
    }

    public String getTypeGeneral() {
        return typeGeneral;
    }

    public void setTypeGeneral(String typeGeneral) {
        this.typeGeneral = typeGeneral;
    }

    public int getFileVisit() {
        return fileVisit;
    }

    public void setFileVisit(int fileVisit) {
        this.fileVisit = fileVisit;
    }

    public int getFileDown() {
        return fileDown;
    }

    public void setFileDown(int fileDown) {
        this.fileDown = fileDown;
    }

    public String getFileurl() {
        return fileurl;
    }

    public void setFileurl(String fileurl) {
        this.fileurl = fileurl;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRankId() {
        return rankId;
    }

    public void setRankId(int rankId) {
        this.rankId = rankId;
    }

    public String getFileKeywords() {
        return fileKeywords;
    }

    public void setFileKeywords(String fileKeywords) {
        this.fileKeywords = fileKeywords;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    public String getFileImgUrl() {
        return fileImgUrl;
    }

    public void setFileImgUrl(String fileImgUrl) {
        this.fileImgUrl = fileImgUrl;
    }




}
