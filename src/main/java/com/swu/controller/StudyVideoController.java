package com.swu.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.swu.service.StudyVideoService;
import com.swu.vo.StudyVideo;

@Controller
public class StudyVideoController {
	
	@Resource(name = "studyVideoService")
	private StudyVideoService studyVideoService;
	
	/**
	 * @return
	 */
	@RequestMapping("/studyVideo/createPage.do")
	public ModelAndView videoCreatePage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/studyVideo/create");
		return mv;
	}
	
	@RequestMapping("/studyVideo/create.do")
	public ModelAndView videoCreate(@RequestParam String url) {
		ModelAndView mv = new ModelAndView();
		StudyVideo sv = new StudyVideo();
		
		int result = 0;
		
		try {
			if(url == null || !"".equals(url)) {
				sv.setUrl(url);
				
				result = studyVideoService.insertUrl(sv);
				
				if(result < 1) {
					System.out.println("실패");
				} else {
					System.out.println("성공");
				}
				
				mv.addObject("url", "/studyVideo/list.do");
			} else {
				throw new Exception("에러");
			}
			
		} catch(Exception e) {
			System.out.println("에러");
		}
		
		return mv;
	}
	
	/**
	 * @return
	 */
	@RequestMapping("/studyVideo/list.do")
	public ModelAndView videoList() {
		ModelAndView mv = new ModelAndView();
		StudyVideo sv = new StudyVideo();
		String url = studyVideoService.slectUrl(sv);
		
		mv.setViewName("/studyVideo/list");
		mv.addObject("url", url);
		return mv;
	}

}
