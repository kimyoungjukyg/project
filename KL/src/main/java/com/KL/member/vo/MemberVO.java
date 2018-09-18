package com.KL.member.vo;

import java.util.Date;

public class MemberVO {
	private String id;
	private String password;
	private String email;
	
	private String approval_status;
	private String approval_key;


/*	private String classify;	//회원 구분
	private String profile_IMG;	//프로필 이미지
	private int email_Confirm;	//이메일 인증여부
	private int trainer_Confirm;	//트레이너 승인여부
*/
	
	public MemberVO() {

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
