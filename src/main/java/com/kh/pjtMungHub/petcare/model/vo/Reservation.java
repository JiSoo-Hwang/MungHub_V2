package com.kh.pjtMungHub.petcare.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {
    private int reservationId; // RESERVATION_ID NUMBER
    private int petSitterId;   // PET_SITTER_ID NUMBER
    private int petOwnerNo;    // PET_OWNER_NO NUMBER
    private String serviceType;   // SERVICE_TYPE NUMBER
    private String address;    // ADDRESS VARCHAR2(200 BYTE)
    private String phone;      // PHONE VARCHAR2(20 BYTE)
    private Date visitDate;    // VISIT_DATE DATE
    private Date visitTime;    // VISIT_TIME DATE
    private int duration;      // DURATION NUMBER
    private Date reservationDate; // RESERVATION_DATE DATE
    private String requests;   // REQUESTS VARCHAR2(200 BYTE)
    private String caution;    // CAUTION VARCHAR2(200 BYTE)
    private int petType;       // PET_TYPE NUMBER
    private String petName;    // PET_NAME VARCHAR2(200 BYTE)
    private int petPhotoNo;    // PET_PHOTO_NO NUMBER
    private String status;     // STATUS VARCHAR2(20 BYTE)
}




