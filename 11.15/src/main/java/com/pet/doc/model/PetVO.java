package com.pet.doc.model;

public class PetVO {
	
	private int pno;
	private String userId;
	private String petName;
	private String petBirthday;
	private String petType;
	private String petMemo;
	private char PetSex = 'M';
	private String PetImg;
	
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getPetBirthday() {
		return petBirthday;
	}
	public void setPetBirthday(String petBirthday) {
		this.petBirthday = petBirthday;
	}
	
	public String getPetType() {
		return petType;
	}
	public void setPetType(String petType) {
		this.petType = petType;
	}
	public String getPetMemo() {
		return petMemo;
	}
	public void setPetMemo(String petMemo) {
		this.petMemo = petMemo;
	}
	
	public char getPetSex() {
		return PetSex;
	}
	public void setPetSex(char petSex) {
		PetSex = petSex;
	}
	public String getPetImg() {
		return PetImg;
	}
	public void setPetImg(String petImg) {
		PetImg = petImg;
	}
	
	
	

}
