package com.kh.pjtMungHub.petcare.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
    private String paymentId; 
    private String pgName; 
    private String userName; 
    private String userId;
    private String amount; 
    private String phone; 
    private String address; 
    private Date paymentDate; 
    private String paymentMethod; 
    private String productName;
    private int paymentStatus; 
}
