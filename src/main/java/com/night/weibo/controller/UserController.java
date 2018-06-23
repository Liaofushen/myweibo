package com.night.weibo.controller;

import com.night.weibo.domain.Fans;
import com.night.weibo.domain.Result;
import com.night.weibo.domain.User;
import com.night.weibo.service.FansService;
import com.night.weibo.service.UserService;
import com.night.weibo.utils.PhotoUtils;
import com.night.weibo.utils.ResultUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.controller
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/10 22:14
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/10 22:14
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private FansService fansService;
    @Autowired
    private HttpSession session;

    /**
     * 用户登录
     *
     * @param userId
     * @param userPass
     * @return
     */
    @PostMapping("/login")
    public Result login(Integer userId, String userPass) {
        if (session.getAttribute("user") != null) {
            session.removeAttribute("user");
        }

        /*if (userId == null || StringUtils.isBlank(userPass)) {
            return ResultUtils.error("用户名或密码为空");
        } else {*/
            User user = userService.findById(userId);
            if (userPass.equals(user.getUserPass())) {
                session.setAttribute("user", user);
                return ResultUtils.success(user);
            } else {
                return ResultUtils.error("用户名或密码错误");
            }
        //}
    }

    /**
     * 用户注销登录
     *
     * @return
     */
    @GetMapping("/logout")
    public Result logout() {
        if (session.getAttribute("user") != null) {
            session.removeAttribute("user");
        }
        return ResultUtils.success();
    }

    /**
     * 用户注册，有上传头像时
     *
     * @param user
     * @param bindingResult
     * @return
     */
    @PostMapping("/register")
    public Result register(@Valid User user, @RequestParam(value = "photo", required = false) MultipartFile file, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResultUtils.error(bindingResult.getFieldError().getDefaultMessage());
        } else if (userService.hasId(user.getUserId())) {
            return ResultUtils.error("该用户账号已经存在");
        } else {
            user.setUserPhoto(PhotoUtils.save(file, user.getUserId()));
            user.setUserTime(new Date(System.currentTimeMillis()));
            return ResultUtils.success(userService.save(user));
        }
    }
    /**
     * 修改资料，有上传头像时
     *
     * @param user
     * @param bindingResult
     * @return
     */
    @PostMapping("/update")
    public Result update(User user, @RequestParam(value = "photo", required = false) MultipartFile file, BindingResult bindingResult) {
        if (user.getUserId() == null) {
            return ResultUtils.error("userId 不空为空");
        } else {
            User user1 = userService.findById(user.getUserId());
            if (user.getUserName() == null) user.setUserName(user1.getUserName());
            if (user.getUserPass() == null) user.setUserPass(user1.getUserPass());
            if (user.getUserTime() == null) user.setUserTime(user1.getUserTime());
            if (user.getUserPhoto() == null) user.setUserPhoto(user1.getUserPhoto());
            if (user.getUserSex() == null) user.setUserSex(user1.getUserSex());
            if (user.getUserAge() == null) user.setUserAge(user1.getUserAge());
            user.setUserPhoto(PhotoUtils.save(file, user.getUserId()));
            return ResultUtils.success(userService.save(user));
        }
    }
    /**
     * 修改资料，无上传头像时
     *
     * @param user
     * @param bindingResult
     * @return
     */
    @PostMapping("/updateWithoutPhoto")
    public Result update(@Valid User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResultUtils.error(bindingResult.getFieldError().getDefaultMessage());
        } else {
            user.setUserTime(userService.findById(user.getUserId()).getUserTime());
            return ResultUtils.success(userService.save(user));
        }
    }

    /**
     * 返回所有user
     *
     * @return
     */
    @GetMapping("/all")
    public Result getAll() {
        List<User> users = userService.findAll();
        return ResultUtils.success(users);
    }

    @PostMapping("/delete/{userId}")
    public Result delete(@PathVariable Integer userId) {
        userService.deleteById(userId);
        return ResultUtils.success();
    }

    /**
     * 根据userId，返回一个user
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Result getOne(@PathVariable Integer id) {
        if (!userService.hasId(id)) {
            return ResultUtils.error("userId不存在");
        }
        User user = userService.findById(id);
        session.setAttribute("user", user);
        return ResultUtils.success(user);
    }

    /**
     * 获得粉丝列表
     * @param userId
     * @return
     */
    @GetMapping("/fans/{userId}")
    public Result getFans(@PathVariable Integer userId) {
        List<Fans> fansList = fansService.getFansByUserId(userId);
        List<User> userList = new ArrayList<>();
        for (Fans f : fansList) {
            User u = userService.findById(f.getUserFirst());
            userList.add(u);
        }
        return ResultUtils.success(userList);
    }


    /**
     * 获得关注人列表
     * @param userId
     * @return
     */
    @GetMapping("/attention/{userId}")
    public Result getAttention(@PathVariable Integer userId) {
        List<Fans> fansList = fansService.getAttentionByUserId(userId);
        List<User> userList = new ArrayList<>();
        for (Fans f : fansList) {
            User u = userService.findById(f.getUserSecond());
            userList.add(u);
        }
        return ResultUtils.success(userList);
    }

    /**
     * userFirst 关注 userSecond
     * @param userFirst
     * @param userSecond
     * @return
     */
    @PostMapping("/fans") //url: user/fans?userFirst=1&userSecond=2
    public Result doFans(@RequestParam Integer userFirst, @RequestParam Integer userSecond) {
        return ResultUtils.success(fansService.save(userFirst, userSecond));
    }

    /**
     * 根据key返回对应的session
     *
     * @param key
     * @return
     */
    @GetMapping("/session/{key}")
    public Result session(@PathVariable String key) {
        Object res = session.getAttribute(key);
        if (res != null)
            return ResultUtils.success(res);
        else
            return ResultUtils.error(key + "不存在!");
    }


    @GetMapping("/test")
    public String test() throws FileNotFoundException {

        File path = new File(ResourceUtils.getURL("classpath:").getPath());
        File upload = new File(path.getAbsolutePath(), "/head/");
        if (!upload.exists()) upload.mkdirs();
        System.out.println("upload url:" + upload.getAbsolutePath());
        return upload.getAbsolutePath();
    }


}
