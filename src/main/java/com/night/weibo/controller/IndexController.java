package com.night.weibo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/index")
    public String index() {
        return "/index";
    }

    @GetMapping("/back")
    public String back(){
        return "/back/index";
    }
}
