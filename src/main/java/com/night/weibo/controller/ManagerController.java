package com.night.weibo.controller;

import com.night.weibo.domain.Manager;
import com.night.weibo.domain.Result;
import com.night.weibo.service.ManagerService;
import com.night.weibo.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.logging.Logger;

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
    private static Logger logger = Logger.getLogger(ManagerController.class.toString());
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
                logger.info(manager.toString() + "注册");
                session.setAttribute("manager", manager);
                return ResultUtils.success(managerService.save(manager));
            }
        }
    }
    @PostMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        logger.info(id.toString() + "删除");
        managerService.delete(id);
        return ResultUtils.success();
    }
}
