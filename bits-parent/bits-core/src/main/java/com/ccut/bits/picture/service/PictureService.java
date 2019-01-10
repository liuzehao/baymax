package com.ccut.bits.picture.service;

import com.ccut.bits.page.Page;
import com.ccut.bits.picture.model.Picture;

import java.util.List;
/**
 * Created by SunJQ on 2016/4/26.
 */
public interface PictureService {
    List<Picture> getAllPicture(Page page);

    Picture getPictureById(int id);

    List<Picture> getPicturesByInventor(String inventor);

    int getTotalRecord();

    List<Picture> getPictureListPage(Picture picture);

   // void addPatentInfo(Patent patent);

    //void deletePatentById(int id);

    //void updatePatentById(Patent patent);
}
