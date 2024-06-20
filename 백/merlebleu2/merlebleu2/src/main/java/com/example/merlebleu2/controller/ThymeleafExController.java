package com.example.merlebleu2.controller;

import com.example.merlebleu2.dto.ProdDto;
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
        ProdDto prodDto = new ProdDto();
        prodDto.setProdNm("랩틸리언가죽자켓");
        prodDto.setCategory1("의류");
        prodDto.setCategory2("자켓");
        prodDto.setListprice(10000);
        prodDto.setDiscount(10);
        prodDto.setSellprice(9000);
        prodDto.setRegTime(LocalDateTime.now());

        model.addAttribute("prodDto", prodDto);
        return "thymeleafEx/thymeleafEx02";
    }

    @GetMapping(value = "/ex03")
    public String thymeleafExample03(Model model){

        List<ProdDto> prodDtoList = new ArrayList<>();

        for(int i=1;i<=10;i++){

            ProdDto prodDto = new ProdDto();
            prodDto.setProdNm("랩틸리언가죽자켓" + i);
            prodDto.setCategory1("의류");
            prodDto.setCategory2("자켓");
            prodDto.setListprice(10000);
            prodDto.setDiscount(10);
            prodDto.setSellprice(9000);
            prodDto.setRegTime(LocalDateTime.now());

            prodDtoList.add(prodDto);
        }

        model.addAttribute("prodDtoList", prodDtoList);
        return "thymeleafEx/thymeleafEx03";
    }

    //상품 리스트 출력


    @GetMapping(value = "/ex07")
    public String thymeleafExample07(){
        return "thymeleafEx/thymeleafEx07";
    }
}

