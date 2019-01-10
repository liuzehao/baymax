package com.ccut.bits.video.service;

import com.ccut.bits.page.Page;
import com.ccut.bits.video.dao.VideoDao;
import com.ccut.bits.video.model.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by hao pc on 2016/5/17.
 */
@Service("VideoService")
public class VideoServicelmp implements VideoService{
    @Autowired
    private VideoDao videoDao;
    @Override
    public List<Video> getAllVideo(Page page){
        Integer size = page.getPageSize();
        Integer begin = (page.getPageNo() - 1) * page.getPageSize();
        return videoDao.getAllVideo(begin,size);
    }
    @Override
   public Video getVideoById(int id){
        return videoDao.getVideoById(id);
    }
}
