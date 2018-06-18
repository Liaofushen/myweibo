package com.night.weibo.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo
 * @ClassName: ${TYPE_NAME}
 * @Description: 微博资讯
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/10 20:49
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/10 20:49
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@Entity
@Getter
@Setter
@ToString(exclude = {"comments"})
@JsonIgnoreProperties(value = {"comments"})
public class News implements Serializable {
    private static final long serialVersionUID = 8763354922350989214L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer newsId;
    private String newsText; //微博内容
    private String newsPhoto; //微博图片路径
    private Timestamp newsTime; //微博发表时间
    private Integer newsLike;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(cascade = CascadeType.REMOVE, mappedBy = "news")
    private List<Comment> comments;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public String getNewsText() {
        return newsText;
    }

    public void setNewsText(String newsText) {
        this.newsText = newsText;
    }

    public String getNewsPhoto() {
        return newsPhoto;
    }

    public void setNewsPhoto(String newsPhoto) {
        this.newsPhoto = newsPhoto;
    }

    public Timestamp getNewsTime() {
        return newsTime;
    }

    public void setNewsTime(Timestamp newsTime) {
        this.newsTime = newsTime;
    }

    public Integer getNewsLike() {
        return newsLike;
    }

    public void setNewsLike(Integer newsLike) {
        this.newsLike = newsLike;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}
