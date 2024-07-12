package com.example.merlebleu2.controller;
import com.example.merlebleu2.dto.CartItemDto;
import com.example.merlebleu2.dto.MemberFormDto;
import com.example.merlebleu2.service.CartService;
import com.example.merlebleu2.service.MemberService;
import com.example.merlebleu2.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.example.merlebleu2.dto.CartDetailDto;
import org.springframework.ui.Model;

import com.example.merlebleu2.dto.CartOrderDto;

@Controller
@RequiredArgsConstructor
public class CartController {

    private final MemberService memberService;
    private final CartService cartService;
    private final OrderService orderService;

    @PostMapping(value = "/cart")
    public @ResponseBody ResponseEntity order(@RequestBody @Valid CartItemDto cartItemDto, BindingResult bindingResult, Principal principal){

        if(bindingResult.hasErrors()){
            StringBuilder sb = new StringBuilder();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();

            for (FieldError fieldError : fieldErrors) {
                sb.append(fieldError.getDefaultMessage());
            }

            return new ResponseEntity<String>(sb.toString(), HttpStatus.BAD_REQUEST);
        }

        String email = principal.getName();
        Long cartItemId;

        try {
            cartItemId = cartService.addCart(cartItemDto, email);
        } catch(Exception e){
            return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<Long>(cartItemId, HttpStatus.OK);
    }

    //카트 목록
    @GetMapping(value = "/cart")
    public String orderHist(Principal principal, Model model){
        List<CartDetailDto> cartDetailList = cartService.getCartList(principal.getName());
        model.addAttribute("cartItems", cartDetailList);
        return "cart/cartList";
    }

    @PatchMapping(value = "/cartItem/{cartItemId}")
    public @ResponseBody ResponseEntity updateCartItem(@PathVariable("cartItemId") Long cartItemId, int count, Principal principal){

        if(count <= 0){
            return new ResponseEntity<String>("최소 1개 이상 담아주세요", HttpStatus.BAD_REQUEST);
        } else if(!cartService.validateCartItem(cartItemId, principal.getName())){
            return new ResponseEntity<String>("수정 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }

        cartService.updateCartItemCount(cartItemId, count);
        return new ResponseEntity<Long>(cartItemId, HttpStatus.OK);
    }

    @DeleteMapping(value = "/cartItem/{cartItemId}")
    public @ResponseBody ResponseEntity deleteCartItem(@PathVariable("cartItemId") Long cartItemId, Principal principal){

        if(!cartService.validateCartItem(cartItemId, principal.getName())){
            return new ResponseEntity<String>("수정 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }

        cartService.deleteCartItem(cartItemId);

        return new ResponseEntity<Long>(cartItemId, HttpStatus.OK);
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/cart/order")
    public String orderCartItems(@RequestBody Map<String, Object> payload, Principal principal, Model model) {
        String email = principal.getName();
        List<Integer> counts = (List<Integer>) payload.get("counts");
        List<Long> cartItemIds = ((List<Integer>) payload.get("cartItemIds")).stream().map(Long::valueOf).collect(Collectors.toList());

        String phonenum = (String) payload.get("phonenum");
        Integer postcode = (Integer) payload.get("postcode");
        String address1 = (String) payload.get("address1");
        String address2 = (String) payload.get("address2");
        String paymentMethod = (String) payload.get("paymentMethod");

        List<CartOrderDto> cartOrderDtos = new ArrayList<>();
        for (int i = 0; i < cartItemIds.size(); i++) {
            CartOrderDto dto = new CartOrderDto(cartItemIds.get(i), counts.get(i));
            cartOrderDtos.add(dto);
        }

        Long orderId = cartService.orderCartItems(cartOrderDtos, email, phonenum, postcode, address1, address2, paymentMethod);

        // 주문 번호를 model에 추가하여 view에서 확인할 수 있게 함
        model.addAttribute("orderId", orderId);
        return "MerleBleu/order/payment"; // 결제 페이지로 이동
    }

    @PostMapping(value = "/cart/orders")
    public @ResponseBody ResponseEntity orderCartItem(@RequestBody CartOrderDto cartOrderDto, Principal principal){

        List<CartOrderDto> cartOrderDtoList = cartOrderDto.getCartOrderDtoList();

        if(cartOrderDtoList == null || cartOrderDtoList.size() == 0){
            return new ResponseEntity<String>("주문할 상품을 선택해주세요", HttpStatus.FORBIDDEN);
        }

        for (CartOrderDto cartOrder : cartOrderDtoList) {
            if(!cartService.validateCartItem(cartOrder.getCartItemId(), principal.getName())){
                return new ResponseEntity<String>("주문 권한이 없습니다.", HttpStatus.FORBIDDEN);
            }
        }

        Long orderId = cartService.orderCartItem(cartOrderDtoList, principal.getName());
        return new ResponseEntity<Long>(orderId, HttpStatus.OK);
    }
}