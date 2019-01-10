package com.ccut.bits.audio.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.audio.model.Audio;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by hao pc on 2016/5/19.
 */
@mybatisScan
public interface AudioDao {
    List<Audio> getAllAudio(@Param("begin") Integer begin, @Param("size") Integer size);
    Audio getAudioById(@Param("id")int id);
}
