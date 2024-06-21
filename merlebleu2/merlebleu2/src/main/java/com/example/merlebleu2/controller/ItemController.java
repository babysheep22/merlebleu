package com.example.merlebleu2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ItemController {

    @GetMapping(value = "/admin/item/new")
    public String itemForm(){
        return "/item/itemForm";
    }

    @GetMapping(value = "/item/itemList")
    public String itemList(){ return "/item/itemList";}
}