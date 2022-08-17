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
	
	@RequestMapping(value = "/reportedRoom", method = RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		logger.info("신고된 방 창입니다.");
		
		return "admin/reportedroom";
	}
	
}