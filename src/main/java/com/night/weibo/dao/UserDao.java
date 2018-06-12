package com.night.weibo.dao;

import com.night.weibo.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.dao
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/10 22:05
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/10 22:05
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
public interface UserDao extends JpaRepository<User, Integer> {
}
