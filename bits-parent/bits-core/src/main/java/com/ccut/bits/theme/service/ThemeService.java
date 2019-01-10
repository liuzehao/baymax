package com.ccut.bits.theme.service;

import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.theme.model.ThemeTree;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by Demon on 2015/4/18.
 */
public interface ThemeService {
    List<ThemeTree> getThemeTree();

    List<String> getThemeNames();

    List<Theme> getCacheThemeNames();

    List<Theme> getTopTheme();

    Map<String,Integer> getChartData();

    Map<String,Integer> getDetailThemeChartData(Integer themeId);

    List<Integer> getAllThemeId();

    List<Theme> getThemesByFileId(int id);

    int getThemeIdByThemeName(@Param("themeName")String themeName);

    void updateThemeHotScore();

  List<Integer> getChildIds(@Param("parentIds")List<java.lang.Integer> parentIds);

    Theme getParentThemeById(@Param("id")int id);

    public String getThemeNameById(@Param("id")int id);
}
