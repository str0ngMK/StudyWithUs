package com.swu.vo;

import java.util.Date;

public class MemberVO {
	private int mem_num;
	private String user_name;
	private String id;
	private String user_pwd;
	private String nickname;
	private String contact;
	private String email;
	private String birth_date;
	private int gender;
	private Date reg_date;
	private Date update_date;
	private String address;
	private int study_time;
	private int reported_user;
	private String to_do_list;
	private int authority;

	/*public MemberVO(String user_name, String id, String user_pwd, String nickname, String contact, String email,
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

	}*/
	
	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
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

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public int getStudy_time() {
		return study_time;
	}

	public void setStudy_time(int study_time) {
		this.study_time = study_time;
	}

	public int getReported_user() {
		return reported_user;
	}

	public void setReported_user(int reported_user) {
		this.reported_user = reported_user;
	}

	public String getTo_do_list() {
		return to_do_list;
	}

	public void setTo_do_list(String to_do_list) {
		this.to_do_list = to_do_list;
	}

}
