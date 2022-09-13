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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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
			return "redirect:/login/loginForm";
		} 
		
		session.setAttribute("member", login);
		return "redirect:/index";
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
	public ModelAndView postRegister(MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		logger.info("post register");
		int result = memberService.idChk(memberVO);
		try {
			mv.setViewName("message");

			if(result == 1) {
				//return "/user/joinform";
				mv.addObject("url", "/user/joinform");
			} else {
				memberService.register(memberVO);
				mv.addObject("url", "/login/loginForm");
				mv.addObject("msg", "회원가입이 완료되었습니다.");
			}
			
		} catch(Exception e) {
			mv.addObject("url", "redirect:/index");
			mv.addObject("msg", "회원가입에 실패했습니다 관리자에게 문의하세요");
			throw new RuntimeException();
		}

		return mv;
	}

	// 회원가입 Get
	@RequestMapping(value = "/user/joinform", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	// 회원가입약관
	@RequestMapping(value = "/user/joinagreeterms", method = RequestMethod.GET)
	public void agree() throws Exception {
		logger.info("get agreement");
	}

	// 아이디찾기
	@RequestMapping(value = "/user/findid", method = RequestMethod.GET)
	public void findid() throws Exception {
		logger.info("find id");
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/user/findpwd", method = RequestMethod.GET)
	public void findpwd() throws Exception {
		logger.info("find pwd");
	}
	
	// 아이디중복확인
//	@ResponseBody
//	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
//	public int idChk(MemberVO vo) throws Exception {
//		int result = memberService.idChk(vo);
//		return result;
//	}
	
	//회원정보관리
	@RequestMapping(value = "/user/membermanagement", method = RequestMethod.GET)
	public void membermanagement() throws Exception {
		logger.info("member management");
	}
	
	//회원정보수정
	@RequestMapping(value = "/user/modifymemberinfo", method = RequestMethod.GET)
	public String modifyGetmemberinfo() throws Exception {
		logger.info("modify Get member info");
			
		return "user/modifymemberinfo";
	}
	
	//회원정보수정
	@RequestMapping(value = "/user/modifymemberinfo", method = RequestMethod.POST)
	public String modifyPostmemberinfo(MemberVO memberVO, HttpSession session) throws Exception {
		logger.info("modify POST member info");
		
		memberService.memberUpdate(memberVO);
		
		session.invalidate();
		
		return "redirect:/index";
	}
	
	//회원탈퇴화면
	@RequestMapping(value = "/user/memberdeleteview", method = RequestMethod.GET)
	public String modifyGetmemberdel() throws Exception {
		logger.info("delete Get member info");
			
		return "user/memberdeleteview";
	}
	
	//회원탈퇴화면
		@RequestMapping(value = "/user/memberdeleteview", method = RequestMethod.POST)
		public String modifyPostmemberdel(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception {
			logger.info("delete Post member info");
			
			//세션에 있는 member를 가져와 member변수에 넣어줌
			MemberVO member = (MemberVO)session.getAttribute("member");
			//세션 비밀번호
			String sessionPass = member.getUser_pwd();
			//vo로 들어오는 비밀번호
			String voPass = memberVO.getUser_pwd();
			
			if(!(sessionPass.equals(voPass))) {
				rttr.addFlashAttribute("msg", false);
				return "redirect:/user/memberdeleteview";
			}
			memberService.memberDelete(memberVO);
			session.invalidate();
			
			return "redirect:/index";
	}
		
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO memberVO) throws Exception {
		int result = memberService.idChk(memberVO);
		return result;
	}
}