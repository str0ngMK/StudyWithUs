package com.swu.mapper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.swu.vo.UserVO;

public interface UserDao {
	
	// 회원 등록
	public void insertUser(UserVO userVO) throws DataAccessException;
}


