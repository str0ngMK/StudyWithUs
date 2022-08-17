package com.swu.vo;

public class UserVO {
	private String user_name;
	private String id;
	private String user_pwd;
	private String nickname;
	private String contact;
	private String email;
	private String birth_date;
	private int gender;
	private String address;

	public UserVO() {
		this("강나라", "kang", "1234", "메롱", "01012345678", "ks@naver.com", "20001020", 1, "서울시 관악구");
	}

	public UserVO(String user_name, String id, String user_pwd, String nickname, String contact, String email,
			String birth_date, int gender, String address) {
		this.user_name = user_name;
		this.id = id;
		this.user_pwd = user_pwd;
		this.nickname = nickname;
		this.contact = contact;
		this.email = email;
		this.birth_date = birth_date;
		this.gender = gender;
		this.address = address;

	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
