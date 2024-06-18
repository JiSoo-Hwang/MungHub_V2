package com.kh.pjtMungHub.petcare.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Refund {
    private int refundId; // REFUND_ID NUMBER PRIMARY KEY
    private int refundAmount; // REFUND_AMOUNT NUMBER NOT NULL
    private Date refundDate; // REFUND_DATE DATE DEFAULT SYSDATE NOT NULL
    private String refundReason; // REFUND_REASON VARCHAR2(500) NOT NULL
    private String paymentId; // PAYMENT_ID NUMBER NOT NULL
    private String refundStatus; // REFUND_STATUS NUMBER NOT NULL
}
