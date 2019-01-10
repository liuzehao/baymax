package com.ccut.bits.video.dao;

/**
 * Created by hao pc on 2016/5/17.
 */

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.video.model.Video;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@mybatisScan
public interface VideoDao {
    List<Video> getAllVideo(@Param("begin") Integer begin, @Param("size") Integer size);
    Video getVideoById(@Param("id")int id);
}
