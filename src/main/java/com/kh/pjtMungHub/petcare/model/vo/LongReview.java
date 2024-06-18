package com.kh.pjtMungHub.petcare.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LongReview {
    private int reviewNo; // REVIEW_NO NUMBER PRIMARY KEY
    private String reviewContent; // REVIEW_CONTENT VARCHAR2(1000)
    private Date reviewDate; // REVIEW_DATE DATE DEFAULT SYSDATE
    private String userNo; // USER_NO NUMBER NOT NULL
    private int houseNo; // HOUSE_NO NUMBER NOT NULL
    private int photoNo; // PHOTO_NO NUMBER NOT NULL
}
