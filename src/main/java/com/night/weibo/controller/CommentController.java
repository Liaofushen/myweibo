package com.night.weibo.controller;

import com.night.weibo.domain.Comment;
import com.night.weibo.domain.Result;
import com.night.weibo.service.CommentService;
import com.night.weibo.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.List;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.controller
 * @ClassName: ${TYPE_NAME}
 * @Description: 微博评论
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/12 12:25
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/12 12:25
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
//@RestController
//@RequestMapping("/comment")
public class CommentController {
//    @Autowired
//    private CommentService commentService;
//
//    /**
//     * 根据commentId查找一comment
//     *
//     * @param commentId
//     * @return
//     */
//    @GetMapping("/{commentId}")
//    public Result<Comment> getByCommentId(@PathVariable Integer commentId) {
//        if (commentService.hasId(commentId)) {
//            return ResultUtils.error("commentId不存在");
//        } else {
//            return ResultUtils.success(commentService.findById(commentId));
//        }
//    }
//
//    /**
//     * 查找某条news下的所有comments
//     *
//     * @param newsId
//     * @return
//     */
//    @GetMapping("/news/{newsId}")
//    public Result<List<Comment>> getByNewsId(@PathVariable Integer newsId) {
//        return ResultUtils.success(commentService.findByNewsId(newsId));
//    }
//
//    /**
//     * 新建
//     *
//     * @param comment
//     * @param bindingResult
//     * @return
//     */
//    @PostMapping("/create")
//    public Result<Comment> create(@Valid Comment comment, BindingResult bindingResult) {
//        if (bindingResult.hasErrors()) {
//            return ResultUtils.error(bindingResult.getFieldError().getDefaultMessage());
//        }
//
//        comment.setCommentTime(new Timestamp(System.currentTimeMillis()));
//        return ResultUtils.success(commentService.save(comment));
//    }
//
//    /**
//     * 根据commentId删除
//     *
//     * @param commentId
//     * @return
//     */
//    @PostMapping("/delete/{commentId}")
//    public Result<Object> delete(@PathVariable Integer commentId) {
//        commentService.delete(commentId);
//        return ResultUtils.success();
//    }

}
