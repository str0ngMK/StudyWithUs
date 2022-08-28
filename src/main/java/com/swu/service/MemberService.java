package com.swu.service;

import java.util.List;

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

	//회원 정보 수정
	public void memberUpdate(MemberVO memberVO) throws Exception;
	
	//회원탈퇴
	public void memberDelete(MemberVO memberVO) throws Exception;
	
	//아이디 중복 체크
	public int idChk(MemberVO memberVO) throws Exception;
	
	//회원 목록 불러오기
	public List<MemberVO> memberList() throws Exception;
}
