package com.night.weibo.dao;

import com.night.weibo.domain.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.dao
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/12 12:00
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/12 12:00
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
public interface CommentDao extends JpaRepository<Comment, Integer> {
//    @Query(value = "SELECT " +
//            "commentId, " +
//            "commentText, " +
//            "commentTime, " +
//            "newsId, " +
//            "userId " +
//            "FROM " +
//            "comment " +
//            "WHERE " +
//            "newsId = ?1 ")
//    List<Comment> findByNewsId(Integer newsId);
}
