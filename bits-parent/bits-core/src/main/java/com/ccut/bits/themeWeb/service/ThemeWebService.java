package com.ccut.bits.themeWeb.service;

import com.ccut.bits.themeWeb.model.PeopleRank;
import com.ccut.bits.themeWeb.model.ThemeWeb;

import java.util.List;

/**
 * Created by Dintama on 2015/5/5.
 */
public interface ThemeWebService {

    List<PeopleRank> getPeopleRank(int id);

    List<ThemeWeb> getThemeWeb(int id);

    int getThemeId(String themeName);

    void addPeopleRank(PeopleRank peopleRank);

    void addThemeWeb(ThemeWeb themeWeb);
}
