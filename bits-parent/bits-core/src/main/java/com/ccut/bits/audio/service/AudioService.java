package com.ccut.bits.audio.service;

import com.ccut.bits.audio.model.Audio;
import com.ccut.bits.page.Page;

import java.util.List;

/**
 * Created by hao pc on 2016/5/19.
 */
public interface AudioService {
    List<Audio> getAllVideo(Page page);
    Audio getVideoById(int id);
}
