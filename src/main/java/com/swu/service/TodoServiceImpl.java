package com.swu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swu.mapper.TodoDAO;
import com.swu.vo.MemberVO;
import com.swu.vo.TodoVO;

@Service
public class TodoServiceImpl implements TodoService {

	@Autowired
	private TodoDAO todoDAO;

	@Override
	public List<TodoVO> list(MemberVO memberSession) throws Exception {
		List todoList = null;
		todoList = todoDAO.list(memberSession);
		return todoList;
	}

	@Override
	public void register(TodoVO vo) throws Exception {
		todoDAO.register(vo);
	}

	@Override
	public void tododelete(int idx) throws Exception {
		todoDAO.tododelete(idx);
		
	}
	
}
