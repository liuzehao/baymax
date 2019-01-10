/*
* SpringTransactionalTestCase.java
* Created on  202015/2/6 10:43
* 版本       修改时间          作者      修改内容
* V1.0.1    202015/2/6       panzhuo    初始版本
*
*/

package com.ccut.bits.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

import javax.sql.DataSource;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@ActiveProfiles("test")
public abstract class SpringTransactionalTestCase extends AbstractTransactionalJUnit4SpringContextTests {
    protected DataSource dataSource;

    @Override
    @Autowired
    public void setDataSource(DataSource dataSource) {
        super.setDataSource(dataSource);
        this.dataSource = dataSource;
    }
}
