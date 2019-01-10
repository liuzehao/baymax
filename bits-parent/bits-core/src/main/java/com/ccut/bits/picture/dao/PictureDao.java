package com.ccut.bits.picture.dao;


import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.picture.model.Picture;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * Created by SunJQ on 2016/4/26.
 */
@mybatisScan
public interface PictureDao {
    List<Picture> getAllPicture(@Param("begin") Integer begin, @Param("size") Integer size);

    Picture getPictureById(@Param("id") int id);

    List<Picture> getPicturesByInventor(@Param("inventor") String inventor);

    //int countPatentByExpertName(@Param("name")String name);

    int getTotalRecord();

    List<Picture> getPictureListPage(Picture picture);

    //void addPatentInfo(Patent patent);

   // void deletePatentById(@Param("id") int id);

    //void updatePatentById(Patent patent);
}
