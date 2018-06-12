package com.night.weibo.handle;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @ProjectName: weibo
 * @Package: com.night.weibo.handle
 * @ClassName: ${TYPE_NAME}
 * @Description: java类作用描述
 * @Author: Fushen Liao
 * @CreateDate: 2018/6/11 16:55
 * @UpdateUser: Fushen Liao
 * @UpdateDate: 2018/6/11 16:55
 * @UpdateRemark: The modified content
 * @Version: 1.0
 */
@Configuration
public class WebMvcConf extends WebMvcConfigurerAdapter {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //和页面有关的静态目录都放在项目的static目录下
        registry.addResourceHandler("/user_images/**").addResourceLocations("classpath:/static/user_images/");
    }

}
