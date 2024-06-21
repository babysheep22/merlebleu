package com.example.merlebleu2.repository;

import com.example.merlebleu2.entity.Item;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
public interface ItemRepository extends JpaRepository<Item,Long> {

    List<Item> findByItemNm(String itemNm);
}
