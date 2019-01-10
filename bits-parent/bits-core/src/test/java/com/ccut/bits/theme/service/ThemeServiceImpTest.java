package com.ccut.bits.theme.service;

import com.ccut.bits.theme.dao.ThemeDao;
import com.ccut.bits.util.SpringTransactionalTestCase;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;

@ContextConfiguration("/applicationContext-test.xml")
public class ThemeServiceImpTest extends SpringTransactionalTestCase {
    @Autowired
    private ThemeService themeService;
    @Test
    public void testUpdateThemeHotScore() throws Exception {

    }
}