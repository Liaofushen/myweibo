package com.night.weibo.utils;

import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.utils
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/11 17:05
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/11 17:05
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
public class PhotoUtils {
    public static String urlSuf() {
        return "default.jpg";
    }

    public static String urlSuf(Integer id) {
        if (id == null) return "default.jpg";
        else return id + ".jpg";
    }

    public static String urlPre() {
        File path = null;
        try {
            path = new File(ResourceUtils.getURL("classpath:").getPath());
            File upload = new File(path.getAbsolutePath(), "/static/head/");
            if (!upload.exists()) upload.mkdirs();
            return upload.getAbsolutePath();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return "/";
    }

    public static String save(MultipartFile file, Integer id) {
        //如果文件不为空，写入上传路径
        //上传文件路径
        String path = urlPre();
        //上传文件名
        String filename = PhotoUtils.urlSuf(id);

        File filepath = new File(path, filename);
        //判断路径是否存在，如果不存在就创建一个
        //为每个用户创建一个目录
        if (!filepath.getParentFile().exists()) {
            filepath.getParentFile().mkdirs();
        }
        //将上传文件保存到一个目标文件当中
        try {
            file.transferTo(new File(path + File.separator + filename));
            return urlSuf(id);
        } catch (IOException e) {
            return urlSuf();
        }
    }

    public static String save() {
        return urlSuf();
    }
}
