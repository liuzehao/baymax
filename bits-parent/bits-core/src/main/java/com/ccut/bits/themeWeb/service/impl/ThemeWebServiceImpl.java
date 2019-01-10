package com.ccut.bits.themeWeb.service.impl;


import com.ccut.bits.themeWeb.dao.ThemeWebDao;
import com.ccut.bits.themeWeb.model.PeopleRank;
import com.ccut.bits.themeWeb.model.ThemeWeb;
import com.ccut.bits.themeWeb.service.ThemeWebService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;


@Service("themeWebService")
public class ThemeWebServiceImpl implements ThemeWebService {

    @Autowired
    private ThemeWebDao themeWebDao;

    @Override
    public List<PeopleRank> getPeopleRank(int id) {
        return themeWebDao.getPeopleRankByThemeId(id);
    }

    @Override
    public List<ThemeWeb> getThemeWeb(int id) {
        List<ThemeWeb> themeWebs = themeWebDao.getThemeWebByThemeId(id);
        Iterator iterator = themeWebs.iterator();
        while(iterator.hasNext()){
            ThemeWeb temp = (ThemeWeb)iterator.next();
            temp.setIdFirst(temp.getIdFirst() - 1);
            temp.setIdSecond(temp.getIdSecond() - 1);
        }
        return themeWebs;
    }

    @Override
    public int getThemeId(String themeName) {
        return themeWebDao.getThemeId(themeName);
    }

    @Override
    public void addPeopleRank(PeopleRank peopleRank) {
        themeWebDao.addPeopleRank(peopleRank);
    }

    @Override
    public void addThemeWeb(ThemeWeb themeWeb) {
        themeWebDao.addThemeWeb(themeWeb);
    }


}
