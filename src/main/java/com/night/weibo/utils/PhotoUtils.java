package com.night.weibo.utils;

import org.springframework.http.HttpRequest;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Random;

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
    private static String url = "localhost:8080/user_images/";
    private static Random random = new Random();

    public static String urlPre() {
        File path = null;
        try {
            path = new File(ResourceUtils.getURL("classpath:").getPath());
            File upload = new File(path.getAbsolutePath(), "/static/user_images/");
            if (!upload.exists()) upload.mkdirs();
            return upload.getAbsolutePath();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return "/";
    }

    public static String save(MultipartFile file, Integer id) {
        String path = urlPre();
        String filename = System.currentTimeMillis() + "_" + random.nextInt(100000) + ".jpg";

        File filepath = new File(path, filename);
        //判断路径是否存在，如果不存在就创建一个
        if (!filepath.getParentFile().exists()) {
            filepath.getParentFile().mkdirs();
        }
        //将上传文件保存到一个目标文件当中
        try {
            file.transferTo(new File(path + File.separator + filename));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return url + filename;
    }

}
