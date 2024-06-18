package com.kh.pjtMungHub.petcare.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DairyRecord {
    private int recordNo; // RECORD_NO NUMBER PRIMARY KEY
    private String dairyContent; // DAIRY_CONTENT VARCHAR2(4000) NOT NULL
    private Date dairyDate; // DAIRY_DATE DATE DEFAULT SYSDATE NOT NULL
    private String userNo; // USER_NO NUMBER NOT NULL
    private int houseNo; // HOUSE_NO NUMBER NOT NULL
    private int photoNo; // PHOTO_NO NUMBER NOT NULL
}
