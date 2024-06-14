package com.kh.pjtMungHub.petcare.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetService {
	private int serviceType;//	SERVICE_TYPE	NUMBER
	private String serviceName;//	SERVICE_NAME	VARCHAR2(50 BYTE)
}
