package com.kh.pjtMungHub.petcare.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetShop {
    private int petShopNo; // PET_SHOP_NO NUMBER PRIMARY KEY
    private String shopName; // SHOP_NAME VARCHAR2(100) NOT NULL
    private String shopAddress; // SHOP_ADDRESS VARCHAR2(200) NOT NULL
    private String shopPhone; // SHOP_PHONE VARCHAR2(20) NOT NULL
    private String possibleService; // POSSIBLE_SERVICE VARCHAR2(1000) NOT NULL
    private String openTime; // OPEN_TIME VARCHAR2(1000) NOT NULL
    private String homepage; // HOMEPAGE VARCHAR2(200) NOT NULL
    private String price; // PRICE VARCHAR2(1000) NOT NULL
    private String certification; // CERTIFICATION VARCHAR2(50) NOT NULL
    private String introductionDetailed; // INTRODUCTION_DETAILED VARCHAR2(4000) NOT NULL
    private int photoNo; // PHOTO_NO NUMBER NOT NULL
}
