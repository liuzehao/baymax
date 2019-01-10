package com.ccut.bits.upload.Model;

/**
 * Created by hao pc on 2016/3/30.
 */
public class File {
    String name;
    String type;
    String time;

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    long   size;
    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    String imgurl;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    int userId;
    public File(String name, String type ,String time,int userId,long size)
    {
        this.name = name;
        this.type = type;
        this.time = time;
        this.userId=userId;
        this.size=size;

    }
    public File(String imgurl,int userId){
        this.userId=userId;
        this.imgurl=imgurl;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }


}
