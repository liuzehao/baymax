package com.ccut.bits.picture.service;
import com.ccut.bits.page.Page;
import com.ccut.bits.picture.dao.PictureDao;
import com.ccut.bits.picture.model.Picture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
/**
 * Created by SunJQ on 2016/4/26.
 */
@Service("pictureService")
public class PictureServiceImp implements PictureService{
    @Autowired
    private PictureDao pictureDao;

    @Override
    public List<Picture> getAllPicture(Page page) {
        Integer size = page.getPageSize();
        Integer begin = (page.getPageNo() - 1) * page.getPageSize();
        return pictureDao.getAllPicture(begin,size);
    }
    @Override
    public Picture getPictureById(int id) {
        return pictureDao.getPictureById(id);
    }

    @Override
    public List<Picture> getPicturesByInventor(String inventor) {
        return pictureDao.getPicturesByInventor(inventor);
    }

    @Override
    public int getTotalRecord() {
        return pictureDao.getTotalRecord();
    }

    @Override
    public List<Picture> getPictureListPage(Picture picture) {
        return pictureDao.getPictureListPage(picture);
    }
}
