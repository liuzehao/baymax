package com.ccut.bits.dict.dao;

import com.ccut.bits.util.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import java.util.LinkedList;

import static org.junit.Assert.*;
@ContextConfiguration("/applicationContext-test.xml")
public class DictionaryDaoTest extends SpringTransactionalTestCase {

    @Autowired
    private DictionaryDao dictionaryDao;
    @Test
    public void testAddWords() throws Exception {
        LinkedList<String> w = new LinkedList<>();
        w.add("aaa");
    }
}