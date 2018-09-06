package com.KL.member.vo;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String gender;
	private int resident_Number;	//주민번호
	private String address;
	private String phone_Number;
	private String email;
	private String classify;	//회원 구분
	private String profile_IMG;	//프로필 이미지
	private int email_Confirm;	//이메일 인증여부
	private int trainer_Confirm;	//트레이너 승인여부

	public MemberVO() {

	}

	public MemberVO(String id, String password, String name, String gender, int resident_Number, String address,
			String phone_Number, String email, String classify, String profile_IMG, int email_Confirm, int trainer_Confirm) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.resident_Number = resident_Number;
		this.address = address;
		this.phone_Number = phone_Number;
		this.email = email;
		this.classify = classify;
		this.profile_IMG = profile_IMG;
		this.email_Confirm = email_Confirm;
		this.trainer_Confirm = trainer_Confirm;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", gender=" + gender
				+ ", resident_Number=" + resident_Number + ", address=" + address + ", phone_Number=" + phone_Number
				+ ", email=" + email + ", classify=" + classify + ", profile_IMG=" + profile_IMG + ", email_Confirm="
				+ email_Confirm + ", trainer_Confirm=" + trainer_Confirm + "]";
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

	public int getResident_Number() {
		return resident_Number;
	}

	public void setResident_Number(int resident_Number) {
		this.resident_Number = resident_Number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone_Number() {
		return phone_Number;
	}

	public void setPhone_Number(String phone_Number) {
		this.phone_Number = phone_Number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public int getEmail_Confirm() {
		return email_Confirm;
	}

	public void setEmail_Confirm(int email_Confirm) {
		this.email_Confirm = email_Confirm;
	}

	public int getTrainer_Confirm() {
		return trainer_Confirm;
	}

	public void setTrainer_Confirm(int trainer_Confirm) {
		this.trainer_Confirm = trainer_Confirm;
	}

}