package com.night.weibo.controller;

import com.night.weibo.domain.News;
import com.night.weibo.domain.Result;
import com.night.weibo.service.NewsService;
import com.night.weibo.service.UserService;
import com.night.weibo.utils.PhotoUtils;
import com.night.weibo.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.Date;
import java.util.logging.Logger;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.controller
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/11 09:18
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/11 09:18
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@RestController
@RequestMapping("/news")
public class NewsController {
    private static Logger logger = Logger.getLogger(NewsController.class.toString());
    @Autowired
    private NewsService newsService;

    @Autowired
    private UserService userService;

    /**
     * 返回全部news
     *
     * @return
     */
    @GetMapping("/all")
    public Result getAll() {
        return ResultUtils.success(newsService.findAll());
    }

    /**
     * 根据newsId, 返回一条news
     *
     * @param newsId
     * @return
     */
    @GetMapping("/{newsId}")
    public Result getByNewsId(@PathVariable Integer newsId) {
        if (!newsService.hasId(newsId)) {
            return ResultUtils.error("newsId不存在");
        }
        return ResultUtils.success(newsService.findById(newsId));
    }

    /**
     * 根据userId, 返回某user的全部news
     *
     * @param userId
     * @return
     */
    @GetMapping("/user/{userId}")
    public Result getByUserId(@PathVariable Integer userId) {
        return ResultUtils.success(newsService.findByUserId(userId));
    }

    /**
     * 点赞数
     * @param id
     * @return
     */
    @PostMapping("/like/{id}")
    public Result like(@PathVariable Integer id) {
        logger.info(id.toString() + "被点赞");
        News news = newsService.findById(id);
        news.setNewsLike(news.getNewsLike() == null ? 1 : news.getNewsLike() + 1);
        return ResultUtils.success(newsService.save(news));
    }

    @PostMapping("/create")
    public Result create(
            @Valid News news,
            @RequestParam(value = "photo", required = false) MultipartFile file,
            @RequestParam("userId") Integer userId,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return ResultUtils.error(bindingResult.getFieldError().getDefaultMessage());
        }
        logger.info(news.toString() + "新建");
        news.setNewsLike(0);
        news.setUser(userService.findById(userId));
        news.setNewsPhoto(PhotoUtils.save(file, userId));
        news.setNewsTime(new Date(System.currentTimeMillis()));
        return ResultUtils.success(newsService.save(news));
    }

    @PostMapping("/createWithoutPhoto")
    public Result create(
            @Valid News news,
            @RequestParam("userId") Integer userId,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return ResultUtils.error(bindingResult.getFieldError().getDefaultMessage());
        }
        logger.info(news.toString() + "新建");
        news.setNewsLike(0);
        news.setUser(userService.findById(userId));
        news.setNewsTime(new Date(System.currentTimeMillis()));
        return ResultUtils.success(newsService.save(news));
    }

    @PostMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        logger.info(id.toString() + "删除");
        newsService.delete(id);
        return ResultUtils.success();
    }
}
