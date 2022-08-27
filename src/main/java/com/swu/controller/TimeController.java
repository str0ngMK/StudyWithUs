package com.swu.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.swu.service.ChatService;
import com.swu.service.TimeService;
import com.swu.vo.MemberVO;
import com.swu.vo.TStudy;

@Controller
public class TimeController {
	
	@Resource(name = "timeService")
	private TimeService timeService;
	
	@Resource(name = "chatService")
	private ChatService chatService;
	
	@RequestMapping("/submitTimer.do")
	public ModelAndView submitTimer(HttpServletRequest request, @RequestParam String rname, String rno, String time) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ChatController cc = new ChatController();
		TStudy study = new TStudy();
		String rowner = "";
		
		HttpSession se = request.getSession();
		MemberVO member = (MemberVO) se.getAttribute("member");
		
		study.setMemNum(member.getMem_num());
		
		study.setNowStudyTime(Integer.parseInt(time));
		
		// 1. STUDY_TBL SELECT
		HashMap<String, Object> studyMap = timeService.selectStudyTime(study);
		
		// 2. INSERT
		if(studyMap == null) {
			timeService.insertStudyTime(study);
		} 
		
		// 3. UPDATE
		else {
			timeService.updateStudyTime(study);
		}
		
		map.put("roomName", rname);
		map.put("roomNumber", rno);
		
		rowner = chatService.selectRowner(map);
		
		map.put("rowner", rowner);
		
		ModelAndView mv = cc.chating(map, "1");
		
		return mv;
	}

}
