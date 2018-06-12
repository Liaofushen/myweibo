package com.night.weibo.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo
 * @ClassName: ${TYPE_NAME}
 * @Description: 微博用户
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
@ToString(exclude = {"newss"})
@JsonIgnoreProperties(value = {"newss"})
public class User implements Serializable {
    private static final long serialVersionUID = -1717570815700593939L;

    @Id
    private Integer userId; //账号

    private String userName; //昵称

    @NotBlank(message = "密码不能为空")
    private String userPass; //密码

    private Boolean userSex; //性别

    private Integer userAge; //年龄

    private String userPhoto; //头像路径

    private Timestamp userTime; //加入微博的时间

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private List<News> newss;
}
