package com.pet.doc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.doc.mapper.LoginMapper;
import com.pet.doc.model.UserVO;

@Service(value = "loginService")
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginMapper loginMapper;
	

	@Override
	public UserVO findUser(UserVO userVO) {
		// TODO Auto-generated method stub
		return loginMapper.findUser(userVO);
	}

	@Override
	public UserVO getUser(String userId) {
		// TODO Auto-generated method stub
		return loginMapper.getUser(userId);
	}

	@Override
	public int insertUser(UserVO userVO) {
		// TODO Auto-generated method stub
		return loginMapper.insertUser(userVO);
	}

	@Override
	public int updateUser(UserVO userVO) {
		// TODO Auto-generated method stub
		return loginMapper.updateUser(userVO);
	}

	@Override
	public int updatePass(UserVO userVO) {
		// TODO Auto-generated method stub
		return loginMapper.updatePass(userVO);
	}

//	@Override
//	public UserVO findPass(String userId, String phone) {
//		// TODO Auto-generated method stub
//		return loginMapper.findPass(userId, phone);
//	}
//
//	@Override
//	public UserVO findId(String name, String phone) {
//		// TODO Auto-generated method stub
//		return loginMapper.findId(name, phone);
//	}
	@Override
	public UserVO findId(UserVO userVO) {
		return loginMapper.findId(userVO);
	}
	@Override
	public UserVO findPass(UserVO userVO) {
		// TODO Auto-generated method stub
		return loginMapper.findPass(userVO);
	}

	@Override
	public int deluser(UserVO userVO) {
		// TODO Auto-generated method stub
		return this.loginMapper.deluser(userVO);
	}
	
	@Override
	public UserVO getwalkobj(String userId) {
		// TODO Auto-generated method stub
		return this.loginMapper.getwalkobj(userId);
	}

	@Override
	public int objupdate(UserVO userVO) {
		// TODO Auto-generated method stub
		return this.loginMapper.objupdate(userVO);
	}
	
	

	
	
}
