package com.kh.pjtMungHub.petcare.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetSitter {
	private int petSitterId;//	PET_SITTER_ID	NUMBER
	private String serviceType;//	SERVICE_TYPE	NUMBER
	private String name;//	NAME	VARCHAR2(50 BYTE)
	private String phone;//	PHONE	VARCHAR2(20 BYTE)
	private String email;//	EMAIL	VARCHAR2(50 BYTE)
	private String address;//	ADDRESS	VARCHAR2(100 BYTE)
}
