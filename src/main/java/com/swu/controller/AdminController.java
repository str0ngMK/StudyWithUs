package com.swu.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swu.service.MemberService;
import com.swu.service.ServiceCenterService;
import com.swu.vo.MemberVO;
import com.swu.vo.TServiceCenter;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	MemberService memberService;
	
	@Inject
	ServiceCenterService servicecenter;
	
	// 회원관리 페이지
	@RequestMapping(value = "/admin/adminmember.do", method = RequestMethod.GET)
	public void adminMember(Model model) throws Exception {
		logger.info("회원관리창입니다.");
		
		List<MemberVO> list = memberService.memberList();
		model.addAttribute("list", list);
	}
	
	// 고객센터 관리
	@RequestMapping(value = "/admin/adminservice.do", method = RequestMethod.GET)
	public void adminService(Model model) throws Exception {
		logger.info("고객센터 관리창입니다.");
		
		List<TServiceCenter> serviceList = servicecenter.serviceList();
		model.addAttribute("serviceList", serviceList);
	}
}
