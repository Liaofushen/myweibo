package com.night.weibo.controller;

import com.night.weibo.domain.Manager;
import com.night.weibo.domain.Result;
import com.night.weibo.service.ManagerService;
import com.night.weibo.service.NewsService;
import com.night.weibo.service.UserService;
import com.night.weibo.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.controller
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/14 13:01
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/14 13:01
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {
    @Autowired
    private ManagerService managerService;
    @Autowired
    private HttpSession session;

    @PostMapping(value = "/login")
    @ResponseBody
    public Result login(@Valid Manager manager, BindingResult bindingResult) {
        if (session.getAttribute("manager") != null) {
            session.removeAttribute("manager");
        }
        if (bindingResult.hasErrors()) {
            return ResultUtils.error(bindingResult.getFieldError().getDefaultMessage());
        } else {
            if (!managerService.hasId(manager.getManagerId())) {
                return ResultUtils.error("账号不存在");
            }
            String managerPass = managerService.findById(manager.getManagerId()).getManagerPass();
            if (!manager.getManagerPass().equals(managerPass)) {
                return ResultUtils.error("账号不存在或密码错误");
            } else {
                session.setAttribute("manager", manager);
                return ResultUtils.success(manager);
            }
        }
    }

    @PostMapping(value = "/register")
    @ResponseBody
    public Result register(@Valid Manager manager, BindingResult bindingResult) {
        if (session.getAttribute("manager") != null) {
            session.removeAttribute("manager");
        }
        if (bindingResult.hasErrors()) {
            return ResultUtils.error(bindingResult.getFieldError().getDefaultMessage());
        } else {
            if (managerService.hasId(manager.getManagerId())) {
                return ResultUtils.error("账号已存在");
            } else {
                session.setAttribute("manager", manager);
                return ResultUtils.success(managerService.save(manager));
            }
        }
    }
}
