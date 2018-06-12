package com.night.weibo.service;

import com.night.weibo.dao.NewsDao;
import com.night.weibo.domain.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.service
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/10 22:08
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/10 22:08
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@Service
public class NewsService {
    @Autowired
    private NewsDao newsDao;

    public News findById(Integer id) {
        return newsDao.findById(id).orElse(new News());
    }

    public boolean hasId(Integer id) {
        return newsDao.findById(id).isPresent();
    }

    public List<News> findAll() {
        return newsDao.findAll();
    }

    @Transactional
    public News save(News news) {
        return newsDao.save(news);
    }

    @Transactional
    public void delete(Integer id) {
        newsDao.deleteById(id);
    }

    public void delete(News news) {
        newsDao.delete(news);
    }

    public List<News> findByUserId(Integer userId) {
        return newsDao.findByUserId(userId);
    }

}
