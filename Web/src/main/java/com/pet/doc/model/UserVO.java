package com.pet.doc.model;

import javax.validation.constraints.NotEmpty;


public class UserVO {
	
	 private int mno; 
	 @NotEmpty(message = "아이디를 입력해주세요!")
	   private String userId;
	 @NotEmpty(message = "비밀번호를 입력해주세요!")
	   private String passwd;
	 @NotEmpty(message = "이름을 입력해주세요!")
	   private String name;
	 @NotEmpty(message = "핸드폰 번호를 입력해주세요!")
	   private String phone;
	   private String regDate;
	   private char del_yn;
	 @NotEmpty(message = "닉네임을 입력해주세요!")
	   private String nickname;
	   private int walkobj;
	 
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public char getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(char del_yn) {
		this.del_yn = del_yn;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getWalkobj() {
		return walkobj;
	}
	public void setWalkobj(int walkobj) {
		this.walkobj = walkobj;
	}
	 
	 

}
