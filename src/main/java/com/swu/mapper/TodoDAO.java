package com.swu.mapper;

import java.util.List;

import com.swu.vo.TodoVO;

public interface TodoDAO {

	//Todolist 목록 
	public List<TodoVO> list(String id) throws Exception;

	//Todolist 입력
	public void register(TodoVO vo) throws Exception;
	
	//Todolist 삭제
	public void tododelete(int idx) throws Exception;
}
