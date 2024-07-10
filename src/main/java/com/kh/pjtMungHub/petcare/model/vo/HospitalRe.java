package com.kh.pjtMungHub.petcare.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HospitalRe {
	private int hosReNo; //예약번호
	private String hosName; //병원이름
	private String hosPhone; //병원연락처
	private String hosAddress; //병원주소
	private String userNo;
	private String petOwnerName; //펫주인이름
	private String ownerPhone; //펫주인 연락처
	private String petName; //펫이름
	private String petGender; //펫성별
	private String neutrality; //중성화 유무 DEFAULT 'N'
	private String petType; //대중소 크기
	private String petKind; //견종
	private Date reDate; //예약일자 DEFAULT SYSDATE
	private Date reTime; //예약시간
	private String symptom; //증상
	private String diseaseNo; //예상병명 (테이블 추가생성)
	private String status; //예약상태
	private Date update; //예약 변경일자 DEFAULT SYSDATE
	private String orginName; //펫사진 원래이름
	private String changeName; //펫사진 서버저장 이름
}
