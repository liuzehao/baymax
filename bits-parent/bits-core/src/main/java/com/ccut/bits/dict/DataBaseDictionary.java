package com.ccut.bits.dict;

import com.ccut.bits.dict.dao.DictionaryDao;
import com.ccut.bits.dict.model.LiteratureDict;
import com.ccut.bits.dict.model.ThemeDict;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.wltea.analyzer.cfg.Configuration;
import org.wltea.analyzer.cfg.DefaultConfig;
import org.wltea.analyzer.dic.Dictionary;
import org.wltea.analyzer.lucene.IKAnalyzer;

import javax.annotation.PostConstruct;
import java.util.LinkedList;
import java.util.List;

/**
 * 基于spring注解@Scheduled的定时任务
 * 每6小时更新一次词库
 */
@Component
@Lazy(false)
public class DataBaseDictionary {
    @Autowired
    DictionaryDao dictionaryDao;

    private DataBaseDictionary(){}

    @PostConstruct
    @Scheduled(cron = "0 0 0/6 * * ?")
    private void init() {
        Configuration cfg = DefaultConfig.getInstance();  //加载词库

        Dictionary.initial(cfg);                          //初始化词库

        Dictionary dictionary = Dictionary.getSingleton();

        List<String> words = new LinkedList<>();
        words.addAll(getThemeDict());
        words.addAll(getLiteratureDict());

        dictionary.addWords(words);
        System.out.println("数据库词典已加载，总共: " + words.size() + "条");
    }

    private List<String> getThemeDict() {
        List<ThemeDict> themeDicts = dictionaryDao.getThemeDictionary();
        List<String> dict = new LinkedList<>();
        for (ThemeDict themeDict : themeDicts) {
            dict.add(themeDict.getThemeName());
            dict.addAll(themeDict.getDict());
        }
        return dict;
    }

    private List<String> getLiteratureDict(){
        List<LiteratureDict> literatureDicts = dictionaryDao.getLiteratureDictionary();
        List<String> dict = new LinkedList<>();
        for (LiteratureDict literatureDict:literatureDicts){
            dict.addAll(literatureDict.getDict());
        }
        return dict;
    }
}
