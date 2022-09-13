package com.swu.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swu.service.ReplyService;
import com.swu.vo.ReplyVO;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Inject
	private ReplyService replyservice;
	
	// 댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWirte(ReplyVO vo) throws Exception {
		
		replyservice.replyWrite(vo);
		
		return "redirect:/board/get?bno=" + vo.getBno();
	}
	
	// 댓글 수정
	
	// 댓글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String postDelete(ReplyVO vo) throws Exception {
			
		replyservice.replyDelete(vo);
		
		return "redirect:/board/get?bno=" + vo.getBno();
	}
}
