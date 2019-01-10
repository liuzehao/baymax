package com.ccut.bits.index;

/**
 * Created by Demon on 2015/5/5.
 */
public interface IndexService {
    boolean initLiteratureIndex();
   // boolean initTextIndex();
    boolean initExpertIndex();
    boolean initAllIndex();
    boolean initPatentIndex();
    boolean initVideoIndex();
    boolean initIntelligenceIndex();
    boolean initPictureIndex();
    boolean initThemeIndex();
    boolean initAudioIndex();
    void scheduledReWriteIndex();

    void autoCreateIndex();
}
