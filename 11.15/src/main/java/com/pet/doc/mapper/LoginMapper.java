package com.pet.doc.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pet.doc.model.ExerciseVO;
import com.pet.doc.model.UserVO;


@Mapper
public interface LoginMapper {
	

	
		UserVO findUser(UserVO userVO);
		UserVO getUser(String userId);
		int updateUser(UserVO userVO);
//		//void deleteUser(UserVO userVO);
//		UserVO findId(@Param("name")String name, @Param("phone")String phone);
//		UserVO findPass(@Param("userId")String userId, @Param("phone")String phone);
		UserVO findId(UserVO userVO);
		
		UserVO findPass(UserVO userVO);
		
		int updatePass(UserVO userVO);
		int insertUser(UserVO userVO);
		int deluser(UserVO userVO);
		
		UserVO getwalkobj(String userId); //목표운동량 가져오기
		
		int objupdate(UserVO userVO);
		

}
