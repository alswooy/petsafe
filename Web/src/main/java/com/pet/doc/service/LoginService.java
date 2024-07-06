package com.pet.doc.service;

import com.pet.doc.model.ExerciseVO;
import com.pet.doc.model.UserVO;

public interface LoginService {
	
	UserVO findUser(UserVO userVO);
	
	UserVO getUser(String userId);
	
	int insertUser(UserVO userVO);
	
	int updateUser(UserVO userVO);
	
	
	int updatePass(UserVO userVO);

//	UserVO findPass(String userId, String phone);
////
//	UserVO findId(String name, String phone);
	UserVO findId(UserVO userVO);
	UserVO findPass(UserVO userVO);
	
	int deluser(UserVO userVO);
	
	UserVO getwalkobj(String userId); // 목표 운동량 가져오기
	
	int objupdate(UserVO userVO); // 목표 운동량 업데이트


}
