package com.ccut.bits.relation;

import com.ccut.bits.util.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import static org.junit.Assert.*;

@ContextConfiguration("/applicationContext-test.xml")
public class ThemeRelationTest extends SpringTransactionalTestCase{

    @Autowired
    ThemeRelation themeRelation;

    @Test
    public void test(){

    }
}