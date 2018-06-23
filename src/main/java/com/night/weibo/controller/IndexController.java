package com.night.weibo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/index")
    public String index() {
        return "/signin";
    }

    @GetMapping("/back")
    public String back(){
        return "/back/index";
    }
    @GetMapping("/signin")
    public String signin() {
        return "/signin";
    }
    @GetMapping("/main")
    public String main() {
        return "/main";
    }
}
