package com.night.weibo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.dao
 * @ClassName: ${TYPE_NAME}
 * @Description: 统一的Controller返回值格式
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/11 13:57
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/11 13:57
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@Getter
@Setter
@ToString
public class Result<T> {
    private Boolean status;
    private String msg;
    private T data;

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
