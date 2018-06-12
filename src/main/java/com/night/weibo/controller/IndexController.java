package com.night.weibo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.controller
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/12 16:49
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/12 16:49
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@Controller
public class IndexController {
    @GetMapping("/index")
    public String index() {
        return "index";
    }
}
