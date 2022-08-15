package com.swu.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.swu.service.NoticeService;
import com.swu.vo.NoticeVO;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private NoticeService service;
	
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String adminMain(Locale locale, Model model) {
		logger.info("메인 관리자창입니다.");
		
		return "admin/adminMain";
	}
	
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String memberList(Locale locale, Model model) {
		logger.info("멤버 관리 창입니다.");
		
		return "admin/memberlist";
	}
	
	@RequestMapping(value = "/memberReported", method = RequestMethod.GET)
	public String memberReported(Locale locale, Model model) {
		logger.info("신고된 회원 관리 창입니다.");
		
		return "admin/memberreported";
	}
	// 공지사항 삭제
	@RequestMapping(value = "admin/delete", method = RequestMethod.GET)
	public String noitcegetDelete(@RequestParam("n_num") int n_num) throws Exception {
		
		service.ndelete(n_num);
		
		return "redirect:/admin/noticepage";
	}
	
	// 공지사항 수정2
		@RequestMapping(value = "admin/noticemodify", method = RequestMethod.POST)
		public String noitcePostModify(NoticeVO vo) throws Exception {
			
			service.nmodify(vo);
			
			return "redirect:noticeview?n_num=" + vo.getN_num();
		}
	
	// 공지사항 수정1
	@RequestMapping(value = "admin/noticemodify", method = RequestMethod.GET)
	public void noitceGetModify(@RequestParam("n_num") int n_num, Model model) throws Exception {
		logger.info("공지사항 수정 창입니다.");
		
		NoticeVO vo = service.nview(n_num);
		
		model.addAttribute("nview", vo);
		
	}
	
	@RequestMapping(value = "admin/noticeview", method = RequestMethod.GET)
	public void noticeView(@RequestParam("n_num") int n_num, Model model) throws Exception {
		
		NoticeVO vo = service.nview(n_num);
		
		model.addAttribute("nview", vo);
	}
	
	@RequestMapping(value = "admin/noticewrite", method = RequestMethod.POST)
	public String noticePostWrite(NoticeVO vo) throws Exception {
		logger.info("공지사항 작성 창입니다.");
		
		service.nwrite(vo);
		
		return "redirect:/admin/noticepage";
	}
	
	@RequestMapping(value = "admin/noticewrite", method = RequestMethod.GET)
	public void noticeGetWrite(Locale locale, Model model) {
		logger.info("공지사항 작성 창입니다.");
		
	}
	
	@RequestMapping(value = "admin/noticepage", method = RequestMethod.GET)
	public void noticeMain(Locale locale, Model model) throws Exception {
		logger.info("공지사항 창입니다.");
		
		List nlist = null;
		nlist = service.nlist();
		model.addAttribute("nlist", nlist);
		
	}
	
	@RequestMapping(value = "/questions", method = RequestMethod.GET)
	public String questions(Locale locale, Model model) {
		logger.info("공지사항 작성 창입니다.");
		
		return "admin/questions";
	}
	
	@RequestMapping(value = "/reportedRoom", method = RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		logger.info("신고된 방 창입니다.");
		
		return "admin/reportedroom";
	}
	
}