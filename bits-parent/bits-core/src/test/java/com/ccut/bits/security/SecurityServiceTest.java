package com.ccut.bits.security;

import com.ccut.bits.security.service.UserService;
import com.ccut.bits.util.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

/**
 * Created by Dintama on 2015/8/9.
 */
@ContextConfiguration("/applicationContext-test.xml")
public class SecurityServiceTest extends SpringTransactionalTestCase {

    @Autowired
    private UserService userService;

    @Test
    public void testAddUserHistory(){
        userService.addUserHistory(1, 2,"3");
    }

}
