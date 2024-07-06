package com.pet.doc.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.doc.mapper.ExerciseMapper;
import com.pet.doc.model.ExerciseVO;
import com.pet.doc.model.UserVO;


@Service(value = "exerciseService")
public class ExerciseServiceImpl implements ExerciseService {
	
	@Autowired
	ExerciseMapper exerciseMapper;


	@Override
	public ExerciseVO getTodayExercise(String userId) {
		// TODO Auto-generated method stub
		return this.exerciseMapper.getTodayExercise(userId);
	}
	
	
	@Override
	public ExerciseVO writeExercise(String userId) {
		// TODO Auto-generated method stub
		return this.exerciseMapper.writeExercise(userId);
	}



	@Override
	public ExerciseVO getArticle(ExerciseVO exerciseVO) {
		return this.exerciseMapper.getArticle(exerciseVO);
	}


	@Override
	public List<ExerciseVO> getSevenData(String userId) {
		// TODO Auto-generated method stub
		return this.exerciseMapper.getSevenData(userId);
	}


	@Override
	public List<ExerciseVO> getMonthData(String userId) {
		// TODO Auto-generated method stub
		return this.exerciseMapper.getMonthData(userId);
	}

	

	

}
