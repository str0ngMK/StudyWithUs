package com.swu.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.swu.vo.MemberVO;
import com.swu.vo.TodoVO;

@Repository("todoDAO")
public class TodoDAOImpl implements TodoDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.swu.mapper.TodoDAO";

	@Override
	public List<TodoVO> list(MemberVO memberSession) throws Exception {
		List<TodoVO> todoList = null;
		todoList = sql.selectList(namespace + ".list", memberSession);
		return todoList;
	}

	@Override
	public void register(TodoVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
	}

	@Override
	public void tododelete(int idx) throws Exception {
		sql.delete(namespace + ".tododelete", idx);
		
	}
	
}
