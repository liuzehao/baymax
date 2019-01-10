/*
* Cn2Spell.java
* Created on  202015/2/17 19:29
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/17     panzhuowen    初始版本
*
*/

package com.ccut.bits.plugin;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

/**
 * 类的描述信息
 * 拼写转换基类
 * @author panzhuowen
 * @version 1.0.1
 */
public class Cn2Spell {
    public Cn2Spell() {
    }

    public static String converterToFirstSpell(String chines) {
        return getSpellForZh(chines, true);
    }

    public static String converterToSpell(String chines) {
        return getSpellForZh(chines, false);
    }

    private static String getSpellForZh(String chines, boolean returnFirstSpell) {
        if(chines != null && !"".equals(chines)) {
            StringBuilder pinyinName = new StringBuilder();
            HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
            defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
            defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
            char[] nameChar = chines.toCharArray();
            char[] arr$ = nameChar;
            int len$ = nameChar.length;

            for(int i$ = 0; i$ < len$; ++i$) {
                char zhChar = arr$[i$];
                if(zhChar > 128) {
                    String spell = returnFirstSpell?getFirstSpellForChar(zhChar, defaultFormat):getSpellForChar(zhChar, defaultFormat);
                    pinyinName.append(spell);
                } else {
                    pinyinName.append(zhChar);
                }
            }

            return pinyinName.toString();
        } else {
            return "";
        }
    }

    private static String getSpellForChar(char zhChar, HanyuPinyinOutputFormat defaultFormat) {
        try {
            String[] badHanyuPinyinOutputFormatCombination = PinyinHelper.toHanyuPinyinStringArray(zhChar, defaultFormat);
            return badHanyuPinyinOutputFormatCombination != null && badHanyuPinyinOutputFormatCombination.length != 0?badHanyuPinyinOutputFormatCombination[0]:String.valueOf(zhChar);
        } catch (BadHanyuPinyinOutputFormatCombination var3) {
            var3.printStackTrace();
            return "";
        }
    }

    private static String getFirstSpellForChar(char zhChar, HanyuPinyinOutputFormat defaultFormat) {
        return getSpellForChar(zhChar, defaultFormat).substring(0, 1);
    }

    public static void main(String[] args) {
        System.out.println(converterToSpell("我马上"));
        System.out.println(converterToFirstSpell("我马上"));
    }
}
