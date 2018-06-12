package com.night.weibo.service;

import com.night.weibo.dao.UserDao;
import com.night.weibo.domain.User;
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
 * @CreateDate: 2018/6/10 22:07
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/10 22:07
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    public List<User> findAll() {
        return userDao.findAll();
    }

    public User findById(Integer id) {
        return userDao.findById(id).orElse(new User());
    }

    public boolean hasId(Integer id) {
        return userDao.findById(id).isPresent() ? true : false;
    }

    @Transactional
    public User save(User user) {
        return userDao.save(user);
    }


}
