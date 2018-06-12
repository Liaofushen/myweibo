package com.night.weibo.dao;

import com.night.weibo.domain.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.dao
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/10 22:06
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/10 22:06
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
public interface NewsDao extends JpaRepository<News, Integer> {
//    @Query(value = "SELECT " +
//            "newsId, " +
//            "newsPhoto, " +
//            "newsText, " +
//            "newsTime, " +
//            "userId " +
//            "FROM " +
//            "News news " +
//            "WHERE " +
//            "userId = ?1 ")
//    List<News> findByUserId(Integer userId);
}
