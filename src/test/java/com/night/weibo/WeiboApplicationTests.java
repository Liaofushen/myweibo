package com.night.weibo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.ResourceUtils;

import java.io.FileNotFoundException;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WeiboApplicationTests {

    @Test
    public void contextLoads() throws FileNotFoundException {
        System.out.println(ResourceUtils.getURL("classpath:/static/head/").getPath());
    }

}
