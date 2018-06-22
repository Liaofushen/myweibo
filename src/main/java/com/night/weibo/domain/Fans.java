package com.night.weibo.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Getter
@Setter
@ToString
public class Fans {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer fansId;

    private Integer userFirst; //关注人
    private Integer userSecond; //被关注人
}
