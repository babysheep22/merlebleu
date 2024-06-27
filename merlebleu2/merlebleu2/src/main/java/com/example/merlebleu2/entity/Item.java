package com.example.merlebleu2.entity;

import com.example.merlebleu2.constant.ItemSellStatus;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;
import com.example.merlebleu2.dto.ItemFormDto;

@Table(name="item")
@Entity
@Getter
@Setter
@ToString
public class Item extends BaseEntity{
    
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

    
    //카테고리
    @Column(nullable = false)
    private String category1;
    @Column(nullable = false)
    private String category2;

    @Enumerated(EnumType.STRING)
    private ItemSellStatus itemSellStatus; //상품 판매 상태

    private LocalDateTime regTime;
    private LocalDateTime updateTime;

    //상품 업데이트 로직
    public void updateItem(ItemFormDto itemFormDto){
        this.itemNm = itemFormDto.getItemNm();
        this.listprice = itemFormDto.getListprice();
        this.sellprice = itemFormDto.getSellprice();
        this.discount = itemFormDto.getDiscount();
        this.stockNumber = itemFormDto.getStockNumber();
        this.category1 = itemFormDto.getCategory1();
        this.category2 = itemFormDto.getCategory2();
        this.itemSellStatus = itemFormDto.getItemSellStatus();
    }
}
