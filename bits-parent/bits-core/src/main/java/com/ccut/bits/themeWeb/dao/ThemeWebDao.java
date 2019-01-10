package com.ccut.bits.themeWeb.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.themeWeb.model.PeopleRank;
import com.ccut.bits.themeWeb.model.ThemeWeb;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@mybatisScan
public interface ThemeWebDao {

    void addPeopleRank(PeopleRank peopleRank);

    List<ThemeWeb> getThemeWebByThemeId(@Param("id") int id);

    List<PeopleRank> getPeopleRankByThemeId(@Param("id") int id);

    int getThemeId(@Param("themeName") String themeName);

    void addThemeWeb(ThemeWeb themeWeb);

}
