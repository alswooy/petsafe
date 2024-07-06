package com.pet.doc.service;

import java.util.List;

import com.pet.doc.model.ExerciseVO;
import com.pet.doc.model.UserVO;

public interface ExerciseService {
	
	ExerciseVO getTodayExercise (String userId);
	
	ExerciseVO writeExercise (String userId); //날짜와 일치하는 DB가 없으면 생성
	
	ExerciseVO getArticle(ExerciseVO exerciseVO);

	
	List<ExerciseVO> getSevenData(String userId);
	
	List<ExerciseVO> getMonthData(String userId);
	
	

}
