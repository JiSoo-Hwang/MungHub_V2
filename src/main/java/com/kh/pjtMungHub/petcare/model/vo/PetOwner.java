package com.kh.pjtMungHub.petcare.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetOwner {
	private int petOwnerNo;//	PET_OWNER_NO	NUMBER
	private String petOwnerId;//	PET_OWNER_ID	VARCHAR2(100 BYTE)
	private String password;//	PASSWORD	VARCHAR2(100 BYTE)
	private String  name;//	NAME	VARCHAR2(50 BYTE)
	private String phone;//	PHONE	VARCHAR2(20 BYTE)
	private String email;//	EMAIL	VARCHAR2(50 BYTE)
	private String address;//	ADDRESS	VARCHAR2(100 BYTE)
}
