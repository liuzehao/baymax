/*
* AutoCompleteController.java
* Created on  202015/2/17 20:26
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/17     panzhuowen    初始版本
*
*/

package com.ccut.bits.autocomplete;

import com.ccut.bits.autocomplete.service.AutoCompleteService;
import com.ccut.bits.model.AutoComplete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@Controller
@RequestMapping({"/autoComplete"})
public class AutoCompleteController {
    @Autowired
    @Qualifier("autoCompleteService")
    private AutoCompleteService autoCompleteService;

    public AutoCompleteController() {
    }

    @RequestMapping
    @ResponseBody
    public List<AutoComplete> autoComplete(AutoComplete autoCompleteParam) {
        return this.autoCompleteService.getAutoCompleteResultList(autoCompleteParam);
    }
}
