package com.kh.pjtMungHub.petcare.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
    private int paymentId; // PAYMENT_ID NUMBER PRIMARY KEY
    private String pgName; // PG_NAME VARCHAR2(50) NOT NULL
    private String userName; // USER_NAME VARCHAR2(50) NOT NULL
    private int amount; // AMOUNT NUMBER NOT NULL
    private String phone; // PHONE VARCHAR2(50) NOT NULL
    private String address; // ADDRESS VARCHAR2(200) NOT NULL
    private Date paymentDate; // PAYMENT_DATE DATE DEFAULT SYSDATE NOT NULL
    private String reservationId; // RESERVATION_ID NUMBER NOT NULL
    private String paymentMethod; // PAYMENT_METHOD NUMBER NOT NULL
    private int paymentStatus; // PAYMENT_STATUS NUMBER NOT NULL
}
