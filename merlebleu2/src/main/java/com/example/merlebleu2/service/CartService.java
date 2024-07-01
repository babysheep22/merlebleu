package com.example.merlebleu2.service;

import com.example.merlebleu2.dto.CartItemDto;
import com.example.merlebleu2.entity.Cart;
import com.example.merlebleu2.entity.CartItem;
import com.example.merlebleu2.entity.Item;
import com.example.merlebleu2.entity.Member;
import com.example.merlebleu2.repository.CartItemRepository;
import com.example.merlebleu2.repository.CartRepository;
import com.example.merlebleu2.repository.ItemRepository;
import com.example.merlebleu2.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import jakarta.persistence.EntityNotFoundException;

import java.util.ArrayList;
import java.util.List;

import org.thymeleaf.util.StringUtils;
import com.example.merlebleu2.dto.OrderDto;

@Service
@RequiredArgsConstructor
@Transactional
public class CartService {

    private final ItemRepository itemRepository;
    private final MemberRepository memberRepository;
    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final OrderService orderService;

    public Long addCart(CartItemDto cartItemDto, String email){

        Item item = itemRepository.findById(cartItemDto.getItemId())
                .orElseThrow(EntityNotFoundException::new);
        Member member = memberRepository.findByEmail(email);

        Cart cart = cartRepository.findByMemberId(member.getId());
        if(cart == null){
            cart = Cart.createCart(member);
            cartRepository.save(cart);
        }

        CartItem savedCartItem = cartItemRepository.findByCartIdAndItemId(cart.getId(), item.getId());

        if(savedCartItem != null){
            savedCartItem.addCount(cartItemDto.getCount());
            return savedCartItem.getId();
        } else {
            CartItem cartItem = CartItem.createCartItem(cart, item, cartItemDto.getCount());
            cartItemRepository.save(cartItem);
            return cartItem.getId();
        }
    }
}