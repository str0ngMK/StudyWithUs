package com.swu.service;

import org.springframework.dao.DataAccessException;

import com.swu.vo.LoginReqVo;
import com.swu.vo.MemberVO;

public interface MemberService {
	// public List listMembers() throws DataAccessException;

	//public int addMember(MemberVO memberVO) throws DataAccessException;

	// public int removeMember(String id) throws DataAccessException;

	//로그인
	public MemberVO login(LoginReqVo reqVo) throws Exception;
	
	//회원가입
	public void register(MemberVO memberVO) throws DataAccessException;
}
