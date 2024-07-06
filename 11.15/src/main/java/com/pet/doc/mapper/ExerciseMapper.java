package com.pet.doc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.doc.model.ExerciseVO;
import com.pet.doc.model.UserVO;

@Mapper
public interface ExerciseMapper {
	
	ExerciseVO getTodayExercise (String userId); //오늘 운동량
	
	ExerciseVO writeExercise(String userId); //날짜와 일치하는 DB가 없으면 생성
	
	ExerciseVO getArticle(ExerciseVO exerciseVO);
	
	List<ExerciseVO> getSevenData(String userId);
	
	List<ExerciseVO> getMonthData(String userId);
	
	

}
