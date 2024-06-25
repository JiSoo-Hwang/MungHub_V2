package com.kh.pjtMungHub.member.model.service;

import java.util.ArrayList;

import com.kh.pjtMungHub.common.model.vo.PetPhoto;
import com.kh.pjtMungHub.kindergarten.model.vo.Kindergarten;
import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.pet.model.vo.Breed;
import com.kh.pjtMungHub.pet.model.vo.Pet;

public interface MemberService {

	Member loginMember(Member m);
	Member searchId(Member m);
	int changePw(Member m);
	int insertMember(Member m);
	Member checkId(Member m);
	int newUserNo();
	ArrayList<Pet> selectPetList(Member m);
	PetPhoto selectPetPhoto(Pet p);
	ArrayList<Kindergarten> selectKindList(Kindergarten kind);
	ArrayList<Breed> selectBreedList();
	
}
