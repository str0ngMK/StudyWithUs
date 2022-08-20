package com.swu.mapper;

import org.springframework.dao.DataAccessException;

import com.swu.vo.LoginReqVo;
import com.swu.vo.MemberVO;

public interface MemberDAO {
	//public List selectAllMemberList() throws DataAccessException;
	
	//회원가입
	public void register(MemberVO memberVO) throws DataAccessException;

	//public int deleteMember(String id) throws DataAccessException;
	
	//로그인
	public MemberVO login(LoginReqVo reqVo) throws DataAccessException;
	
}
