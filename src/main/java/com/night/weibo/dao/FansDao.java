package com.night.weibo.dao;

import com.night.weibo.domain.Fans;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FansDao extends JpaRepository<Fans, Integer> {
    List<Fans> findByUserFirst(Integer id);
    List<Fans> findByUserSecond(Integer id);
}
