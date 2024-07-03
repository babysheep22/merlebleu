package com.example.merlebleu2.controller;

import com.example.merlebleu2.dto.MainItemDto;
import com.example.merlebleu2.service.ItemService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.ui.Model;
import com.example.merlebleu2.dto.ItemFormDto;

import com.example.merlebleu2.service.ItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import com.example.merlebleu2.dto.ItemSearchDto;
import com.example.merlebleu2.entity.Item;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class ItemController {

    private final ItemService itemService;
    @GetMapping(value = "/admin/item/new")
    public String itemForm(Model model){
        model.addAttribute("itemFormDto", new ItemFormDto());
        return "item/itemForm";
    }

    @PostMapping(value = "/admin/item/new")
    public String itemNew(@Valid ItemFormDto itemFormDto, BindingResult bindingResult,
                          Model model, @RequestParam("itemImgFile") List<MultipartFile> itemImgFileList){

        if(bindingResult.hasErrors()){
            return "item/itemForm";
        }

        if(itemImgFileList.get(0).isEmpty() && itemFormDto.getId() == null){
            model.addAttribute("errorMessage", "첫번째 상품 이미지는 필수 입력 값 입니다.");
            return "item/itemForm";
        }

        try {
            itemService.saveItem(itemFormDto, itemImgFileList);
        } catch (Exception e){
            model.addAttribute("errorMessage", "상품 등록 중 에러가 발생하였습니다.");
            return "item/itemForm";
        }

        return "redirect:/admin/item/new"; //등록 후 메인페이지로
    }

    @GetMapping(value = "/admin/item/{itemId}")
    public String itemDtl(@PathVariable("itemId") Long itemId, Model model){

        try {
            ItemFormDto itemFormDto = itemService.getItemDtl(itemId);
            model.addAttribute("itemFormDto", itemFormDto);
        } catch(EntityNotFoundException e){
            model.addAttribute("errorMessage", "존재하지 않는 상품 입니다.");
            model.addAttribute("itemFormDto", new ItemFormDto());
            return "item/itemForm";
        }

        return "item/itemForm";
    }

    //상품 수정
    @PostMapping(value = "/admin/item/{itemId}")
    public String itemUpdate(@Valid ItemFormDto itemFormDto, BindingResult bindingResult,
                             @RequestParam("itemImgFile") List<MultipartFile> itemImgFileList, Model model){
        if(bindingResult.hasErrors()){
            return "item/itemForm";
        }

        if(itemImgFileList.get(0).isEmpty() && itemFormDto.getId() == null){
            model.addAttribute("errorMessage", "첫번째 상품 이미지는 필수 입력 값 입니다.");
            return "item/itemForm";
        }

        try {
            itemService.updateItem(itemFormDto, itemImgFileList);
        } catch (Exception e){
            model.addAttribute("errorMessage", "상품 수정 중 에러가 발생하였습니다.");
            return "item/itemForm";
        }

        return "redirect:/merlebleu/main";
    }


//목록 페이지
    @GetMapping(value = {"/admin/items", "/admin/items/{page}"})
    public String itemManage(ItemSearchDto itemSearchDto, @PathVariable("page") Optional<Integer> page, Model model) {

        // Create a Pageable object for pagination, defaulting to page 0 with 3 items per page
        Pageable pageable = PageRequest.of(page.orElse(0), 3);

        // Fetch a paginated list of items based on search criteria and pagination info
        Page<Item> items = itemService.getAdminItemPage(itemSearchDto, pageable);

        // Add the list of items to the model to be accessible in the view
        model.addAttribute("items", items);
        // Add the search criteria to the model
        model.addAttribute("itemSearchDto", itemSearchDto);
        // Add the maxPage attribute to control pagination in the view
        model.addAttribute("maxPage", 5);

        // Return the name of the view to render
        return "item/itemMng";
    }

    //상세 페이지
    @GetMapping(value = "/item/{itemId}")
    public String itemDtl(Model model, @PathVariable("itemId") Long itemId){
        ItemFormDto itemFormDto = itemService.getItemDtl(itemId);
        model.addAttribute("item", itemFormDto);
        return "item/itemDtl";
    }

    @GetMapping("/merlebleu/search_outer")
    public String getItemsByOuterCategory(@RequestParam(value = "category1", defaultValue = "아우터") String category1,
                                          @RequestParam(value = "category2", required = false) String category2,
                                          ItemSearchDto itemSearchDto, Pageable pageable, Model model) {
        itemSearchDto.setCategory1(category1);
        itemSearchDto.setCategory2(category2);

        Page<MainItemDto> items = itemService.getItemsByCategory(itemSearchDto, pageable);

        model.addAttribute("items", items);
        model.addAttribute("itemSearchDto", itemSearchDto);
        return "MerleBleu/prod/prodList/search_outer";
    }

    @GetMapping("/merlebleu/search_top")
    public String getItemsByTopCategory(@RequestParam(value = "category1", defaultValue = "탑") String category1,
                                          @RequestParam(value = "category2", required = false) String category2,
                                          ItemSearchDto itemSearchDto, Pageable pageable, Model model) {
        itemSearchDto.setCategory1(category1);
        itemSearchDto.setCategory2(category2);

        Page<MainItemDto> items = itemService.getItemsByCategory(itemSearchDto, pageable);

        model.addAttribute("items", items);
        model.addAttribute("itemSearchDto", itemSearchDto);
        return "MerleBleu/prod/prodList/search_top";
    }

    @GetMapping("/merlebleu/search_skirt")
    public String getItemsBySkirtCategory(@RequestParam(value = "category1", defaultValue = "스커트") String category1,
                                        @RequestParam(value = "category2", required = false) String category2,
                                        ItemSearchDto itemSearchDto, Pageable pageable, Model model) {
        itemSearchDto.setCategory1(category1);
        itemSearchDto.setCategory2(category2);

        Page<MainItemDto> items = itemService.getItemsByCategory(itemSearchDto, pageable);

        model.addAttribute("items", items);
        model.addAttribute("itemSearchDto", itemSearchDto);
        return "MerleBleu/prod/prodList/search_skirt";
    }

    @GetMapping("/merlebleu/search_pants")
    public String getItemsByPantsCategory(@RequestParam(value = "category1", defaultValue = "팬츠") String category1,
                                          @RequestParam(value = "category2", required = false) String category2,
                                          ItemSearchDto itemSearchDto, Pageable pageable, Model model) {
        itemSearchDto.setCategory1(category1);
        itemSearchDto.setCategory2(category2);

        Page<MainItemDto> items = itemService.getItemsByCategory(itemSearchDto, pageable);

        model.addAttribute("items", items);
        model.addAttribute("itemSearchDto", itemSearchDto);
        return "MerleBleu/prod/prodList/search_pants";
    }

    @GetMapping("/merlebleu/search_onpiece")
    public String getItemsByOnepiecesCategory(@RequestParam(value = "category1", defaultValue = "원피스") String category1,
                                          @RequestParam(value = "category2", required = false) String category2,
                                          ItemSearchDto itemSearchDto, Pageable pageable, Model model) {
        itemSearchDto.setCategory1(category1);
        itemSearchDto.setCategory2(category2);

        Page<MainItemDto> items = itemService.getItemsByCategory(itemSearchDto, pageable);

        model.addAttribute("items", items);
        model.addAttribute("itemSearchDto", itemSearchDto);
        return "MerleBleu/prod/prodList/search_onpiece";
    }

    @GetMapping("/merlebleu/search_stuff")
    public String getItemsByStuffCategory(@RequestParam(value = "category1", defaultValue = "패션잡화") String category1,
                                              @RequestParam(value = "category2", required = false) String category2,
                                              ItemSearchDto itemSearchDto, Pageable pageable, Model model) {
        itemSearchDto.setCategory1(category1);
        itemSearchDto.setCategory2(category2);

        Page<MainItemDto> items = itemService.getItemsByCategory(itemSearchDto, pageable);

        model.addAttribute("items", items);
        model.addAttribute("itemSearchDto", itemSearchDto);
        return "MerleBleu/prod/prodList/search_stuff";
    }

    //카테고리1 끝


}