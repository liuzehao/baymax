package com.ccut.bits.patent.service;

import com.ccut.bits.page.Page;
import com.ccut.bits.patent.dao.PatentDao;
import com.ccut.bits.patent.model.Patent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Demon on 2015/4/11.
 */
@Service("patentService")
public class PatentServiceImp implements PatentService {
    @Autowired
    private PatentDao patentDao;

    @Override
    public List<Patent> getAllPatent(Page page) {
        Integer size = page.getPageSize();
        Integer begin = (page.getPageNo() - 1) * page.getPageSize();
        return patentDao.getAllPatent(begin,size);
    }

    @Override
    public Patent getPatentById(int id) {
        return patentDao.getPatentById(id);
    }

    @Override
    public List<Patent> getPatentsByInventor(String inventor) {
        return patentDao.getPatentsByInventor(inventor);
    }

    @Override
    public int getTotalRecord() {
        return patentDao.getTotalRecord();
    }

    @Override
    public List<Patent> getPatentListPage(Patent patent) {
        return patentDao.getPatentListPage(patent);
    }

    @Override
    public void addPatentInfo(Patent patent) {
        patentDao.addPatentInfo(patent);
    }

    @Override
    public void deletePatentById(int id) {
        patentDao.deletePatentById(id);
    }

    @Override
    public void updatePatentById(Patent patent) {
        patentDao.updatePatentById(patent);
    }

}
