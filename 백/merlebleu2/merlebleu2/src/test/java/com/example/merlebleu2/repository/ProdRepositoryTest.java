package com.example.merlebleu2.repository;

import static org.junit.jupiter.api.Assertions.*;
import com.example.merlebleu2.entity.Prod;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

import java.time.LocalDateTime;
import java.util.List;


@SpringBootTest
@TestPropertySource(locations = "classpath:application-test.properties")
class ProdRepositoryTest {
    @Autowired
    ProdRepository prodRepository;

    @Test
    @DisplayName("상품 저장 테스트")
    public void createProdTest(){
        Prod prod = new Prod();
        prod.setProdNm("테스트 상품");
        prod.setListprice(20000);
        prod.setDiscount(10);
        prod.setSellprice(18000);
        prod.setCategory1("의류");
        prod.setCategory2("아우터");
        prod.setRegTime(LocalDateTime.now());
        Prod savedProd = prodRepository.save(prod);
        System.out.println(savedProd.toString());
    }

    public void createProdList(){
        for(int i=1; i<= 10; i++){
            Prod prod = new Prod();
            prod.setProdNm("테스트 상품" + i);
            prod.setSellprice(10000+i);
            prod.setDiscount(50);
            prod.setListprice(5000+i);
            prod.setCategory1("의류"+i);
            prod.setCategory2("아우터"+i);
            prod.setUpdateTime(LocalDateTime.now());
            Prod savedProd = prodRepository.save(prod);
        }

    }

    @Test
    @DisplayName("상품명 조회 테스트")
    public void findByProdNmTest(){
        this.createProdList();
        List<Prod> prodList = prodRepository.findByProdNm("테스트 상품1");
        for(Prod prod : prodList){
            System.out.println(prod.toString());
        }
    }

}