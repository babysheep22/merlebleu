package com.example.merlebleu2.controller;

import com.example.merlebleu2.dto.ItemDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/thymeleaf")
public class ThymeleafExController {
    @GetMapping(value = "/ex01")
    public String thymeleafExample01(Model model){
        model.addAttribute("data", "타임리프 예제 입니다.");
        return "thymeleafEx/thymeleafEx01";
    }

    //상품 데이터 출력 연습
    @GetMapping(value = "/ex02")
    public String thymeleafExample02(Model model){
        ItemDto itemDto = new ItemDto();
        itemDto.setItemNm("랩틸리언가죽자켓");
        itemDto.setCategory1("의류");
        itemDto.setCategory2("자켓");
        itemDto.setListprice(10000);
        itemDto.setDiscount(10);
        itemDto.setSellprice(9000);
        itemDto.setRegTime(LocalDateTime.now());

        model.addAttribute("itemDto", itemDto);
        return "thymeleafEx/thymeleafEx02";
    }

    @GetMapping(value = "/ex03")
    public String thymeleafExample03(Model model){

        List<ItemDto> itemDtoList = new ArrayList<>();

        for(int i=1;i<=10;i++){

            ItemDto itemDto = new ItemDto();
            itemDto.setItemNm("랩틸리언가죽자켓" + i);
            itemDto.setCategory1("의류");
            itemDto.setCategory2("자켓");
            itemDto.setListprice(10000);
            itemDto.setDiscount(10);
            itemDto.setSellprice(9000);
            itemDto.setRegTime(LocalDateTime.now());

            itemDtoList.add(itemDto);
        }

        model.addAttribute("itemDtoList", itemDtoList);
        return "thymeleafEx/thymeleafEx03";
    }

    //상품 리스트 출력


    @GetMapping(value = "/ex07")
    public String thymeleafExample07(){
        return "thymeleafEx/thymeleafEx07";
    }
}

