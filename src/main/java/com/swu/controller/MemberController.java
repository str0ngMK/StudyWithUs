package com.swu.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swu.service.MemberService;
import com.swu.vo.LoginReqVo;
import com.swu.vo.MemberVO;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	// 로그인 버튼 누르면 로그인 되게
	@RequestMapping(value = "/login/loginCheck", method = RequestMethod.POST)
	public String login(LoginReqVo vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");

		HttpSession session = req.getSession();

		MemberVO login = memberService.login(vo);

		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}
		return "redirect:/";
	}

	// 화면에 로그인창 보이게하기
	@RequestMapping(value = "/login/loginForm", method = RequestMethod.GET)
	public void login(Locale locale, Model model) throws Exception {

	}

	// 로그아웃
	@RequestMapping(value = "/login/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/login/loginForm";
	}

	// 회원가입
	@RequestMapping(value = "/user/joinform", method = RequestMethod.POST)
	public String postRegister(MemberVO memberVO) throws Exception {
		logger.info("post register");
		memberService.register(memberVO);
		System.out.println(memberVO.getUser_name());

		return "redirect:/login/loginForm";
	}

	// 회원가입 Get
	@RequestMapping(value = "/user/joinform", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
}
