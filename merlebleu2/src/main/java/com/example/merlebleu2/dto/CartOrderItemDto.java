package com.example.merlebleu2.dto;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartOrderItemDto {
    private Long itemId;
    private Integer count;
    private String itemNm;
    private String imgUrl;

}
