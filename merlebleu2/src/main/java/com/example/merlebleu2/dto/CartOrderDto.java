package com.example.merlebleu2.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CartOrderDto {

    private Long cartItemId;

    private List<CartOrderDto> cartOrderDtoList;

    private List<CartOrderItemDto> cartOrderItemDtoList;

    public Integer count;
}