package com.ccut.bits.upload.service;

import com.ccut.bits.upload.Dao.upload;
import com.ccut.bits.upload.Model.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by hao pc on 2016/3/30.
 */
@Service("Upload")
public class Uploadlm {
    @Autowired
    private upload oo;

    public void addPermission(File modler) {
      oo.upload(modler);
    }
    public void addimg(File modler){oo.uploadImg(modler);}

}
