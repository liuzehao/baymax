package com.ccut.bits.aop;

import com.ccut.bits.theme.service.ThemeService;
import com.ccut.bits.util.HadoopUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Dintama on 2015/8/18.
 */
@Component
@Lazy(false)
public class HadoopTask {

    @Autowired
    private ThemeService themeService;

    private HadoopUtil hadoopUtil = new HadoopUtil();

    @Scheduled(cron = "0 0 0 16 * ?")
    public void create() throws Exception {
        System.out.println("csv文件创建中……");
        List<Integer> ids = themeService.getAllThemeId();
        for(Integer id : ids){
            hadoopUtil.getExpertTheme(id);
        }
        System.out.println("csv文件创建完成！");
    }

    @Scheduled(cron = "0 10 0 16 * ?")
    public void update() throws Exception {
        System.out.println("csv文件上传中……");
        List<Integer> ids = themeService.getAllThemeId();
        for(Integer id : ids){
            hadoopUtil.updateHdfs(id);
        }
        System.out.println("csv文件上传完成！");
    }

    @Scheduled(cron = "0 0 1 16 * ?")
    public void downLoad() throws Exception {
        System.out.println("csv文件下载中……");
        List<Integer> ids = themeService.getAllThemeId();
        for(Integer id : ids){
            hadoopUtil.updateHdfs(id);
        }
        System.out.println("csv文件下载完成！");
    }

    @Scheduled(cron = "0 15 1 16 * ?")
    public void save() throws Exception {
        System.out.println("csv文件数据库录入中……");
        List<Integer> ids = themeService.getAllThemeId();
        for(Integer id : ids){
            hadoopUtil.readerCsvFile(id);
        }
        System.out.println("csv文件数据库录入完成！");
    }




}
