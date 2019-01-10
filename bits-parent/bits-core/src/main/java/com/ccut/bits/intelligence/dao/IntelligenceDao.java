package com.ccut.bits.intelligence.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.intelligence.model.Intelligence;

import java.util.List;

/**
 * Created by Demon on 2015/5/16.
 */
@mybatisScan
public interface IntelligenceDao {
    List<Intelligence> getAllIntelligence();
}
