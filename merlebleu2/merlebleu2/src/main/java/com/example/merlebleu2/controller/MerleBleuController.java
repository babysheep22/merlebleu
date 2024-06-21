package com.example.merlebleu2.controller;

import lombok.Value;
import org.springframework.ui.Model;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/merlebleu")
public class MerleBleuController {
    @GetMapping(value = "/")
    public String merlebleuMain(Model model){
        return "/MerleBleu/main.html";
    } //메인페이지 경로

    @GetMapping(value = "/search_outer")
    public String merlbleusearchouter(Model model){
        return "MerleBleu/prod/prodList/search_outer.html"; //상품 목록 경로
    }
}
