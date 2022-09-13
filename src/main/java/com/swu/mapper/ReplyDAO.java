package com.swu.mapper;

import java.util.List;

import com.swu.vo.ReplyVO;

public interface ReplyDAO {
	
	// 댓글 조회
	public List<ReplyVO> replyList(int bno) throws Exception;
	
	// 댓글 쓰기
	public void replyWrite(ReplyVO vo) throws Exception;
	
	// 댓글 삭제
	public void replyDelete(ReplyVO vo) throws Exception;
	
}
