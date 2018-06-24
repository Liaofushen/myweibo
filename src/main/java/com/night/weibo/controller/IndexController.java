package com.night.weibo.controller;

import com.night.weibo.domain.User;
import com.night.weibo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class IndexController {
    @Autowired
    private UserService userService;

    @GetMapping("/index")
    public String index() {
        return "/signin";
    }

    @GetMapping("/back")
    public String back() {
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

    @GetMapping("/view/{userId}")
    public String viewUser(@PathVariable Integer userId, ModelMap modelMap) {
        User user = userService.findById(userId);
        modelMap.addAttribute("viewUser", user);
        return "/view";
    }
}
