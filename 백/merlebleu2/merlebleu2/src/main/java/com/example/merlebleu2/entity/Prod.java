package com.example.merlebleu2.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Table(name="prod")
@Entity
@Getter
@Setter
@ToString
public class Prod {
    
    @Id
    @Column(name="prod_code")
    @GeneratedValue(strategy = GenerationType.AUTO)
    //아이디
    private Long id;
    
    @Column(nullable = false, length = 50)
    //상품이름
    private String prodNm;

    //정가, 판매가 , 할인율
    @Column(nullable = false)
    private Integer listprice;
    @Column(nullable = false)
    private Integer sellprice;
    @Column(nullable = false)
    private Integer discount;
    
    
    //private int stockNumber; //재고수량
    //private ProdSellStatus prodSellStatus; 판매상태

    
    //카테고리
    @Column(nullable = false)
    private String category1;
    @Column(nullable = false)
    private String category2;

    private LocalDateTime regTime;
    private LocalDateTime updateTime;

    //대표상품 이미지 링크
    //private Character mainimgurl;
}
