package com.swu.service;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.swu.mapper.UserDao;
import com.swu.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDao userdao;
	
	public void insertUser(UserVO userVO) throws DataAccessException{
		userdao.insertUser(userVO);
	}
}
