package com.night.weibo.handle;

import com.night.weibo.domain.Result;
import com.night.weibo.utils.ResultUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.handle
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/11 15:42
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/11 15:42
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@ControllerAdvice
public class ExceptionHandle {

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Result<Exception> handle(Exception e) {
        return ResultUtils.error(e.toString());
    }
}
