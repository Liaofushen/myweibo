package com.night.weibo.domain;

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
 * @Package: com.night.weibo.domain
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/14 12:44
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/14 12:44
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@Entity
@Getter
@Setter
@ToString
public class Manager implements Serializable {

    private static final long serialVersionUID = -6557298328549452719L;
    @Id
    private Integer managerId; //账号

    private String managerName; //昵称

    @NotBlank(message = "密码不能为空")
    private String managerPass; //密码
}
