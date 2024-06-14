package com.kh.pjtMungHub.petcare.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetPhoto {
	private int phothNo;//	PHOTO_NO	NUMBER
	private String originName;//	ORIGIN_NAME	VARCHAR2(255 BYTE)
	private String changeName;//	CHANGE_NAME	VARCHAR2(255 BYTE)
	private String filePath;//	FILE_PATH	VARCHAR2(2000 BYTE)
	private Date uploadDate;//	UPLOAD_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	private String reservationId;//	RESERVATION_ID	NUMBER
}
