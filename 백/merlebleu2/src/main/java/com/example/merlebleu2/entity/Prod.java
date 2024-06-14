package com.example.merlebleu2.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
public class Prod {
    //아이디
    private Long id;

    //상품이름
    private String prodNm;
    // 상품코드
    private String prodCode;

    //정가, 판매가 , 할인율
    private Integer listprice;
    private Integer sellprice;
    private Integer discount;

    private int stockNumber; //재고수량

    //카테고리
    private String category1;
    private String category2;

    private LocalDateTime regTime;
    private LocalDateTime updateTime;

    //대표상품 이미지 링크
    //private Character mainimgurl;
}
