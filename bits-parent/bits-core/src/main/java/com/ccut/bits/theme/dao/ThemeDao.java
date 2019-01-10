package com.ccut.bits.theme.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.theme.model.Theme;
import com.ccut.bits.theme.model.ThemeTree;
import com.ccut.bits.theme.model.ThemeHot;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Demon on 2015/4/14.
 */
@mybatisScan
public interface ThemeDao {
    String getThemeNameById(@Param("id")int id);

Theme getParentThemeById(@Param("id")int id);

    List<ThemeTree> getParentTheme();

    List<ThemeTree> getChildTheme();

    List<Integer> getParentIds(@Param("childIds")List<Integer> childIds);

    List<Integer> getChildIds(@Param("parentIds")List<Integer> parentIds);

    List<Theme> getAllTheme();

    List<Theme> getTopTheme(@Param("size") int size);

    List<Integer> getTopThemeIdsByIds(@Param("ids")List<Integer> ids,@Param("topSize")int topSize);

    List<Theme> getThemesByExpertId(@Param("id")int id);

    List<Theme> getThemesByFileId(@Param("id")int id);

    List<ThemeHot> getAllThemeHot();

    int getThemeIdByThemeName(@Param("themeName")String themeName);

    List<Integer> getThemeIdsByLiteratureIds(@Param("ids")List<Integer> ids);

    List<Integer> getThemeIdsByExpertIds(@Param("ids")List<Integer> ids);

    List<ThemeHot> getThemeHotByExpertNumDESC();
    List<ThemeHot> getThemeHotByLiteratureNumDESC();
    List<Integer> getAllThemeId();

    boolean updateThemeHotScoreById(@Param("id")int id,@Param("score")double score);

    boolean updateThemeHotPatentNum();

    boolean updateThemeHotLiteratureNum();

    boolean updateThemeUserVisit();

    boolean updateThemeExpertNum();


}
