package com.swu.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("홈페이지");

		return "home";
	}

	@RequestMapping(value = "/intro/intro.do", method = RequestMethod.GET)
	public String introduction(Locale locale, Model model) {
		logger.info("소개 페이지");

		return "intro/intro";
	}
}
