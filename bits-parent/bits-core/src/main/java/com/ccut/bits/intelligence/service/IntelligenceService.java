package com.ccut.bits.intelligence.service;

import com.ccut.bits.intelligence.dao.IntelligenceDao;
import com.ccut.bits.intelligence.model.Intelligence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Demon on 2015/5/16.
 */
@Service
public class IntelligenceService {
    @Autowired
    IntelligenceDao intelligenceDao;

    public List<Intelligence> getAllIntelligence(){
        return intelligenceDao.getAllIntelligence();
    }
}
