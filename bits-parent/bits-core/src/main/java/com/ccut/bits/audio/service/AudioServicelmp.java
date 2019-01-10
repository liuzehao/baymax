package com.ccut.bits.audio.service;

import com.ccut.bits.audio.dao.AudioDao;
import com.ccut.bits.audio.model.Audio;
import com.ccut.bits.page.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by hao pc on 2016/5/19.
 */
@Service("AudioService")
public class AudioServicelmp implements AudioService{
    @Autowired
    private AudioDao audioDao;
    @Override
    public List<Audio> getAllVideo(Page page){
        Integer size = page.getPageSize();
        Integer begin = (page.getPageNo() - 1) * page.getPageSize();
        return audioDao.getAllAudio(begin,size);
    }
    @Override
    public Audio getVideoById(int id){
        return audioDao.getAudioById(id);
    }
}
