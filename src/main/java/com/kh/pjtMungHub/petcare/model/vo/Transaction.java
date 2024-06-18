package com.kh.pjtMungHub.petcare.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Transaction {
    private int transactionId; // TRANSACTION_ID NUMBER PRIMARY KEY
    private Date transactionDate; // TRANSACTION_DATE DATE DEFAULT SYSDATE NOT NULL
    private int transactionAmount; // TRANSACTION_AMOUNT NUMBER NOT NULL
    private String paymentId; // PAYMENT_ID NUMBER NOT NULL
    private String userNo; // USER_NO NUMBER NOT NULL
}
