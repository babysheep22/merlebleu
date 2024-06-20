package com.example.merlebleu2.repository;

import com.example.merlebleu2.entity.Prod;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
public interface ProdRepository extends JpaRepository<Prod,Long> {

    List<Prod> findByProdNm(String prodNm);
}
