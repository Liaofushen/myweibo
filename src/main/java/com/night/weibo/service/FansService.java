package com.night.weibo.service;

import com.night.weibo.dao.FansDao;
import com.night.weibo.domain.Fans;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FansService {
    @Autowired
    private FansDao fansDao;

    public List<Fans> getFansByUserId(Integer id) {
        return fansDao.findByUserSecond(id);
    }

    public List<Fans> getAttentionByUserId(Integer id) {
        return fansDao.findByUserFirst(id);
    }

    public Fans save(Integer userFirst, Integer userSecond) {
        Fans fans = new Fans();
        fans.setUserFirst(userFirst);
        fans.setUserSecond(userSecond);
        return fansDao.save(fans);
    }
}
