package com.ccut.bits.patent.service;

import com.ccut.bits.page.Page;
import com.ccut.bits.patent.model.Patent;

import java.util.List;

/**
 * Created by Demon on 2015/4/11.
 */
public interface PatentService {
    List<Patent> getAllPatent(Page page);

    Patent getPatentById(int id);

    List<Patent> getPatentsByInventor(String inventor);

    int getTotalRecord();

    List<Patent> getPatentListPage(Patent patent);

    void addPatentInfo(Patent patent);

    void deletePatentById(int id);

    void updatePatentById(Patent patent);
}
