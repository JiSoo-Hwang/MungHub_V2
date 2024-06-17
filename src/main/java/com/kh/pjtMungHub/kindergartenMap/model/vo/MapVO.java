package com.kh.pjtMungHub.kindergartenMap.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MapVO {
private int kindNo;//	KIND_NO
private String directorId;//	DIRECTOR_ID
private String regionName;//	REGION_NAME
private String kindAddress;//	KIND_ADDRESS
private String kindName;//	KIND_NAME
private String kindContact;//	KIND_CONTACT
private double placeX;//	PLACE_X
//	PLACE_Y
//	STATUS
}
