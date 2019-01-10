package com.ccut.bits.upload.Dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.upload.Model.File;



@mybatisScan
public interface upload {
    void upload(File modle);
    void uploadImg(File modle);
}
