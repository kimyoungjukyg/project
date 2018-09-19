package com.KL.member.vo;

import java.util.Date;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String email;
	private String gender;
	private String address;
	private String phone_number;
	private String approval_status;
	private String approval_key;


private String classify;	//회원 구분
	private String profile_IMG;	//프로필 이미지
	
	private int trainer_Confirm;	//트레이너 승인여부

	
	public MemberVO() {

	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone_number() {
		return phone_number;
	}


	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}


	public String getClassify() {
		return classify;
	}


	public void setClassify(String classify) {
		this.classify = classify;
	}


	public String getProfile_IMG() {
		return profile_IMG;
	}


	public void setProfile_IMG(String profile_IMG) {
		this.profile_IMG = profile_IMG;
	}


	public int getTrainer_Confirm() {
		return trainer_Confirm;
	}


	public void setTrainer_Confirm(int trainer_Confirm) {
		this.trainer_Confirm = trainer_Confirm;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	

	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}





	public String getApproval_status() {
		return approval_status;
	}


	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}


	public String getApproval_key() {
		return approval_key;
	}


	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}



	
}   
