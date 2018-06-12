package com.night.weibo.controller;

import com.night.weibo.domain.News;
import com.night.weibo.domain.Result;
import com.night.weibo.service.NewsService;
import com.night.weibo.utils.PhotoUtils;
import com.night.weibo.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.List;

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
    @Autowired
    private NewsService newsService;

    /**
     * 返回全部news
     * @return
     */
    @GetMapping("/all")
    public Result<List<News>> getAll() {
        return ResultUtils.success(newsService.findAll());
    }

    /**
     * 根据newsId, 返回一条news
     * @param newsId
     * @return
     */
    @GetMapping("/{newsId}")
    public Result<List<News>> getByNewsId(@PathVariable Integer newsId) {
        if (!newsService.hasId(newsId)) {
            return ResultUtils.error("newsId不存在");
        }
        return ResultUtils.success(newsService.findById(newsId));
    }

    /**
     * 根据userId, 返回某user的全部news
     * @param userId
     * @return
     */
    @GetMapping("/user/{userId}")
    public Result<List<News>> getByUserId(@PathVariable Integer userId) {
        return ResultUtils.success(newsService.findByUserId(userId));
    }
//
//    @PostMapping("/create")
//    public Result<News> create(@Valid News news, BindingResult bindingResult) {
//        if (bindingResult.hasErrors()) {
//            return ResultUtils.error(bindingResult.getFieldError().getDefaultMessage());
//        }
//        news.setNewsTime(new Timestamp(System.currentTimeMillis()));
//        return ResultUtils.success(newsService.save(news));
//    }
//
    @PostMapping("/create")
    public Result<News> create(@Valid News news, MultipartFile file, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResultUtils.error(bindingResult.getFieldError().getDefaultMessage());
        }
        news = newsService.save(news);
        news.setNewsPhoto(PhotoUtils.save(file, news.getNewsId()));
        news.setNewsTime(new Timestamp(System.currentTimeMillis()));
        return ResultUtils.success(newsService.save(news));
    }

    @PostMapping("/delete/{id}")
    public Result<Object> delete(@PathVariable Integer id) {
        newsService.delete(id);
        return ResultUtils.success();
    }
}
