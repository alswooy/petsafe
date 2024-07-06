package com.pet.doc.service;

import java.util.List;

import com.pet.doc.model.PetVO;

public interface PetService {
	
	List<PetVO> getPetList(String userId);
	

	PetVO getArticle(int pno); //글조회
	int writeArticle(PetVO pet); // 글 쓰기
	int updateArticle(PetVO pet);//글 수정
	int deleteArticle(int pno); // 글 삭제

}
