package com.kh.pjtMungHub.member.model.service;

import java.util.ArrayList;

import com.kh.pjtMungHub.common.model.vo.PetPhoto;
import com.kh.pjtMungHub.kindergarten.model.vo.Kindergarten;
import com.kh.pjtMungHub.member.model.vo.Member;
import com.kh.pjtMungHub.member.model.vo.Message;
import com.kh.pjtMungHub.pet.model.vo.Breed;
import com.kh.pjtMungHub.pet.model.vo.Pet;

public interface MemberService {

	Member loginMember(Member m);
	Member searchId(Member m);
	int changePw(Member m);
	int insertMember(Member m);
	int insertTeacher(Member m);
	Member checkId(Member m);
	ArrayList<Pet> selectPetList(Member m);
	PetPhoto selectPetPhoto(Pet p);
	ArrayList<Kindergarten> selectKindList(Kindergarten kind);
	ArrayList<Breed> selectBreedList();
	ArrayList<Message> selectMessageList(Member m,int i);
	int msgCount(Member m);
	int getPhotoNo();
	int insertPetPhoto(PetPhoto petPhoto);
	int insertPet(Pet p);
	Pet selectPetByNo(Pet p);
	int updatePet(Pet p);
	int updateMember(Member m);
	ArrayList<Member> searchUser(Member m);
	ArrayList<Kindergarten> myKind(Member m);
	ArrayList<Member> searchTeacherByKind(Kindergarten k);
	int acceptTeacher(Member m);
	int notTeacher(Member m);
	int newMaster(Member m);
	int deletePhoto(Pet p);
	int updateMsg(Message msg);
	int sendMsg(Message msg);
	
}
