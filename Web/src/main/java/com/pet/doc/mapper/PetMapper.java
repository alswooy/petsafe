package com.pet.doc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.pet.doc.model.PetVO;




@Mapper
public interface PetMapper {
	
	List<PetVO> getPetList(String userId);
	

	
	PetVO getArticle(int pno); //글조회
	int writeArticle(PetVO pet); // 글 쓰기
	int updateArticle(PetVO pet);//글 수정
	int deleteArticle(int pno); // 글 삭제

}
