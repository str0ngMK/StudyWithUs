package com.swu.service;

import org.springframework.dao.DataAccessException;

import com.swu.vo.UserVO;

public interface UserService {
	
	// 회원 등록
		public void insertUser(UserVO userVO) throws DataAccessException;
}
