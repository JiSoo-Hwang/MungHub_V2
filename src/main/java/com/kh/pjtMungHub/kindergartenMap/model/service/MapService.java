package com.kh.pjtMungHub.kindergartenMap.model.service;

import java.util.ArrayList;

import com.kh.pjtMungHub.kindergartenMap.model.vo.MapVO;
import com.kh.pjtMungHub.pet.model.vo.Pet;



public interface MapService {

	public ArrayList<MapVO> selectMap();
	public Pet selectPet(int ownerNo);
	public MapVO selectKindergarten(int kindNo);
}
