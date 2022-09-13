package com.swu.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swu.service.TimeService;
import com.swu.vo.TStudy;

@Controller
public class IndexController {
	
		@Inject
		private TimeService time;
	
		private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
		// 인덱스 페이지
		@RequestMapping(value = "/index", method = RequestMethod.GET)
		public void getRegister() throws Exception {
			logger.info("index");
			
		}
		
		// 에러 페이지
		@RequestMapping(value = "/error", method = RequestMethod.GET)
		public void getError() throws Exception {
			logger.info("error");
			
		}
		
		// 랭킹 페이지
		@RequestMapping(value = "/ranking", method = RequestMethod.GET)
		public void getRanking(Model model) throws Exception {
			logger.info("랭킹 페이지");
			
			List<TStudy> ranklist = null;
			ranklist = time.list();
			model.addAttribute("ranklist", ranklist);

		}
		
}
