package com.pet.doc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.doc.mapper.PetMapper;
import com.pet.doc.model.CalendarVO;
import com.pet.doc.model.PetVO;


@Service(value = "petService")
public class PetServiceImpl implements PetService {
	
	
	@Autowired
	PetMapper petMapper;
	
	@Override
	public List<PetVO> getPetList(String userId) {
		// TODO Auto-generated method stub
		return this.petMapper.getPetList(userId);
	}
	

	@Override
	public PetVO getArticle(int pno) {
		// TODO Auto-generated method stub
		return this.petMapper.getArticle(pno);
	}

	@Override
	public int writeArticle(PetVO pet) {
		// TODO Auto-generated method stub
		return this.petMapper.writeArticle(pet);
	}

	@Override
	public int updateArticle(PetVO pet) {
		// TODO Auto-generated method stub
		return this.petMapper.updateArticle(pet);
	}

	@Override
	public int deleteArticle(int pno) {
		// TODO Auto-generated method stub
		return this.petMapper.deleteArticle(pno);
	}

}
