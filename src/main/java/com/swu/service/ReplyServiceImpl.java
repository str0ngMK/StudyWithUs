package com.swu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.swu.mapper.ReplyDAO;
import com.swu.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> replyList(int bno) throws Exception {
		return dao.replyList(bno);
	}

	@Override
	public void replyWrite(ReplyVO vo) throws Exception {
		dao.replyWrite(vo);
	}

	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		dao.replyDelete(vo);
	}

}
