package com.ccut.bits.patent.dao;

import com.ccut.bits.annotation.mybatisScan;
import com.ccut.bits.patent.model.Patent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Demon on 2015/4/11.
 */
@mybatisScan
public interface PatentDao {
    List<Patent> getAllPatent(@Param("begin")Integer begin,@Param("size")Integer size);

    Patent getPatentById(@Param("id")int id);

    List<Patent> getPatentsByInventor(@Param("inventor")String inventor);

    int countPatentByExpertName(@Param("name")String name);

    int getTotalRecord();

    List<Patent> getPatentListPage(Patent patent);

    void addPatentInfo(Patent patent);

    void deletePatentById(@Param("id") int id);

    void updatePatentById(Patent patent);
}
