package com.ccut.bits.dict.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.dict.model.LiteratureDict;
import com.ccut.bits.dict.model.ThemeDict;

import java.util.List;

/**
 * Created by Demon on 2015/5/15.
 */
@mybatisScan
public interface DictionaryDao {
    List<ThemeDict> getThemeDictionary();

    List<LiteratureDict> getLiteratureDictionary();
}
