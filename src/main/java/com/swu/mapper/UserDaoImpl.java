package com.swu.mapper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.swu.vo.UserVO;

public class UserDaoImpl implements UserDao {
	
	@Inject
	private SqlSession sqlSession;
	
	public void insertUser(UserVO userVO) throws DataAccessException{
		sqlSession.insert("com.swu.mapper.UserDao", userVO);
	}

}
