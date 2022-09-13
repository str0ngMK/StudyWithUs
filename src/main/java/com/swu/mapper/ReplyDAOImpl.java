package com.swu.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.swu.vo.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.swu.mapper.ReplyDAO";
	
	// 댓글 조회
	@Override
	public List<ReplyVO> replyList(int bno) throws Exception {
		return sql.selectList(namespace + ".replyList", bno);
	}
	
	// 댓글 작성
	@Override
	public void replyWrite(ReplyVO vo) throws Exception {
		sql.insert(namespace + ".replyWrite", vo);
	}

	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		sql.delete(namespace + ".replyDelete", vo);
		
	}
	
}
