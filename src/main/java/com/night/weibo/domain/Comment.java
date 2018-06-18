package com.night.weibo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.domain
 * @ClassName: ${TYPE_NAME}
 * @Description: 微博评论
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/10 23:35
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/10 23:35
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@Entity
@Getter
@Setter
@ToString
public class Comment implements Serializable {
    private static final long serialVersionUID = -2627592817449954424L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer commentId;
    private String commentText; //评论内容
    private Timestamp commentTime; //评论时间

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "news_id")
    private News news;


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public Timestamp getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Timestamp commentTime) {
        this.commentTime = commentTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }
}
