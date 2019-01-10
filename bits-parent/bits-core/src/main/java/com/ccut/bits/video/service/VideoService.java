package com.ccut.bits.video.service;

import com.ccut.bits.page.Page;
import com.ccut.bits.video.model.Video;

import java.util.List;

/**
 * Created by hao pc on 2016/5/17.
 */
public interface VideoService {
    List<Video> getAllVideo(Page page);
    Video getVideoById(int id);
}
