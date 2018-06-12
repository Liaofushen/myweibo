package com.night.weibo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.domain
 * @ClassName: ${TYPE_NAME}
 * @Description: 微博点赞
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/11 15:15
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/11 15:15
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@Entity
@Getter
@Setter
@ToString
public class Like {
    @Id
    @GeneratedValue
    private Integer likeId;
}
