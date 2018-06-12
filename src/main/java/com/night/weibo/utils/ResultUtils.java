package com.night.weibo.utils;

import com.night.weibo.domain.Result;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.utils
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/11 13:55
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/11 13:55
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
public class ResultUtils {

    public static Result success(Object object) {
        Result result = new Result();
        result.setStatus(true);
        result.setMsg("成功");
        result.setData(object);
        return result;
    }

    public static Result success() {
        return success(null);
    }

    public static Result error(String msg) {
        Result result = new Result();
        result.setStatus(false);
        result.setMsg(msg);
        return result;
    }
}
