package com.swu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.swu.common.Constants;
import com.swu.service.ServiceCenterService;
import com.swu.vo.MemberVO;
import com.swu.vo.TServiceCenter;

@Controller
public class ServiceCenterController {
	
	@Resource(name = "serviceCenterService")
	private ServiceCenterService serviceCenterService;
	
	List<TServiceCenter> serviceList = new ArrayList<TServiceCenter>();

	@RequestMapping("/serviceCenter.do")
	public String serviceCenter() {
		return "serviceCenter";
	}
	
	@RequestMapping("/askService.do")
	public ModelAndView askService(@RequestParam HashMap<String, Object> params, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		TServiceCenter tsc = new TServiceCenter();
		mv.setViewName("/message");

		MemberVO memberSession = (MemberVO) session.getAttribute("member");
		
		String title = "";
		String content = "";
		String message = "";
		
		if(params == null) {
			message = Constants.ERROR_MSG;
		} else {
			title = params.get("title").toString();
			content = params.get("content").toString();
			
			tsc.setMemNum(memberSession.getMem_num());
			tsc.setTitle(title);
			tsc.setContent(content);
			tsc.setId(memberSession.getId());
			
			int result = serviceCenterService.insertService(tsc);
			
			if(result < 1) {
				message = Constants.ERROR_MSG;
			} else {
				message = Constants.SUCCESS_ASK_MSG;
				serviceList.add(tsc);
			}
		}
		
		mv.addObject("msg", message);
		return mv;
		
	}
}
