package com.example.merlebleu2.entity;

import com.example.merlebleu2.constant.ItemSellStatus;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Table(name="item")
@Entity
@Getter
@Setter
@ToString
public class Item {
    
    @Id
    @Column(name="item_code")
    @GeneratedValue(strategy = GenerationType.AUTO)
    //아이디
    private Long id;
    
    @Column(nullable = false, length = 50)
    //상품이름
    private String itemNm;

    //정가, 판매가 , 할인율
    @Column(nullable = false)
    private Integer listprice;
    @Column(nullable = false)
    private Integer sellprice;
    @Column(nullable = false)
    private Integer discount;
    
    
    private int stockNumber; //재고수량
    //private ItemSellStatus itemSellStatus; 판매상태

    
    //카테고리
    @Column(nullable = false)
    private String category1;
    @Column(nullable = false)
    private String category2;

    @Enumerated(EnumType.STRING)
    private ItemSellStatus itemSellStatus; //상품 판매 상태

    private LocalDateTime regTime;
    private LocalDateTime updateTime;

    //대표상품 이미지 링크
    //private Character mainimgurl;
}
