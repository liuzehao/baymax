package com.ccut.bits.literature.model;

import com.ccut.bits.page.PageBase;
import com.ccut.bits.theme.model.Theme;

import java.util.List;

/**
 * Created by Demon on 2015/4/11.
 */
public class Literature extends PageBase {
    private int id;
    private String abs;
    private String authorCn;
    private String unit;
    private String journalCn;
    private String appDate;
    private String key;
    private String title;
    private List<Theme> themeList;
    private String fileDownUrl;
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
    int flag;

    public int getTotleScore() {
        return totleScore;
    }

    public void setTotleScore(int totleScore) {
        this.totleScore = totleScore;
    }

    int totleScore;//文件分数
    public List<Theme> getThemeList() {
        return themeList;
    }

    public String getFileDownUrl() {
        return fileDownUrl;
    }

    public void setFileDownUrl(String fileDownUrl) {
        this.fileDownUrl = fileDownUrl;
    }


    public void setThemeList(List<Theme> themeList) {
        this.themeList = themeList;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAbs() {
        return abs;
    }

    public void setAbs(String abs) {
        this.abs = abs;
    }

    public String getAuthorCn() {
        return authorCn;
    }

    public void setAuthorCn(String authorCn) {
        this.authorCn = authorCn;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getJournalCn() {
        return journalCn;
    }

    public void setJournalCn(String journalCn) {
        this.journalCn = journalCn;
    }

    public String getAppDate() {
        return appDate;
    }

    public void setAppDate(String appDate) {
        this.appDate = appDate;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int setFileUniqueId() {
        return fileUniqueId;
    }

    public void setFileUniqueId(int fileUniqueId) {
        this.fileUniqueId = fileUniqueId;
    }

    public int getFileUniqueId() {
        return fileUniqueId;
    }

    public String getTypeGeneral() {
        return typeGeneral;
    }

    public void setTypeGeneral(String typeGeneral) {
        this.typeGeneral = typeGeneral;
    }

    public String getFileAbstract() {
        return fileAbstract;
    }

    public void setFileAbstract(String fileAbstract) {
        this.fileAbstract = fileAbstract;
    }



    public int getFileVisit() {
        return fileVisit;
    }

    public void setFileVisit(int fileVisit) {
        this.fileVisit = fileVisit;
    }


    public String getFileImgUrl() {
        return fileImgUrl;
    }

    public void setFileImgUrl(String fileImgUrl) {
        this.fileImgUrl = fileImgUrl;
    }
    public void setFileImgUrl() {}//防空指针
    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
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


    public String getFileTime() {
        return fileTime;
    }

    public void setFileTime(String fileTime) {
        this.fileTime = fileTime;
    }


    public int getFileDown() {
        return fileDown;
    }

    public void setFileDown(int fileDown) {
        this.fileDown = fileDown;
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

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public String getFileurl() {
        return fileurl;
    }

    public void setFileurl(String fileurl) {
        this.fileurl = fileurl;
    }


}
