package com.night.weibo.service;

import com.night.weibo.dao.ManagerDao;
import com.night.weibo.domain.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.service
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/14 12:54
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/14 12:54
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@Service
public class ManagerService {
    @Autowired
    private ManagerDao managerDao;

    public List<Manager> findAll() {
        return managerDao.findAll();
    }

    public boolean hasId(Integer id) {
        return managerDao.findById(id).isPresent();
    }

    public Manager findById(Integer id) {
        return managerDao.findById(id).orElse(new Manager());
    }

    public Manager save(Manager manager) {
        return managerDao.save(manager);
    }

    @Transactional
    public void delete(Integer id) {
        managerDao.deleteById(id);
    }
}
