package com.swu.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swu.service.TodoService;
import com.swu.vo.MemberVO;
import com.swu.vo.TodoVO;

@Controller
public class TodoController {
	
	@Inject
	private TodoService service;
	
	// todolist 정보 가져오기
	@RequestMapping(value ="/todo/adtodo.do", method = RequestMethod.GET)
	public void gettodo(Model model, HttpSession session) throws Exception{
		
		MemberVO memberSession = (MemberVO)session.getAttribute("member");
		
		/*HttpSession session = req.getSession();*/
		/* String id = "${sessionScope.member.id}"; */
	
		List<TodoVO> todolist = service.list(memberSession);
		
		model.addAttribute("todolist", todolist);
		model.addAttribute("todo", new TodoVO());
			
	}
	
	@RequestMapping(value="todo/registertodo.do", method = RequestMethod.POST)
	public String postRegister(TodoVO vo) throws Exception {
		service.register(vo);
		
		return "redirect: /todo/adtodo.do";
	}
	
	@RequestMapping(value="todo/deletetodo.do", method = RequestMethod.POST)
	public String postDelete(int idx) throws Exception {
		service.tododelete(idx);
		
		return "redirect: /todo/adtodo.do";
	}
	
	
}
