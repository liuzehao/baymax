package com.ccut.bits.dict;

import com.ccut.bits.util.SpringTransactionalTestCase;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration("/applicationContext-test.xml")
public class DataBaseDictionaryTest extends SpringTransactionalTestCase {
    @Autowired
    private DataBaseDictionary dict;

    @Test
    public void testInit(){

    }

}