package com.swu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.swu.common.Constants;
import com.swu.service.ChatService;
import com.swu.vo.MemberVO;
import com.swu.vo.TRoom;

@Controller
public class ChatController {
	
	@Resource(name = "chatService")
	private ChatService chatService;
	
	List<TRoom> roomList = new ArrayList<TRoom>();
	static int roomNumber = 0;

	@RequestMapping("/chat.do")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}
	/**
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room.do")
	public ModelAndView TRoom() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("room");
		return mv;
	}
	
	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom.do")
	public ModelAndView createRoom1(HttpSession session, @RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/message");
		
		MemberVO memberSession = (MemberVO) session.getAttribute("member");
		
		TRoom room = new TRoom();
		
		String roomName = "";
		String category = "";
		String userCount = "";
		String pwdYn = "";
		String pwd = "";
		
		int result = 0;
		String message = "";
		
		if(params == null) {
			message = Constants.ERROR_MSG;
		} else {
			roomName = params.get("roomName").toString();
			category = params.get("category").toString();
			userCount = params.get("userCount").toString();
			pwdYn = params.get("pwdYn").toString();
			pwd = params.get("pwd").toString();
			
			room.setRname(roomName);
			room.setRowner(memberSession.getId());
			room.setCategory(category);
			room.setMaxUser(Integer.parseInt(userCount));
			
			if(pwdYn.equals("1")) {
				room.setPassword(pwd);
			}
			
			result = chatService.insertRoomInfo(room);
			
			if(result < 1) {
				message = Constants.ERROR_MSG;
			} else {
				message = Constants.CREATE_ROOM_SUCCESS;
				roomList.add(room);
			}
		}
		
		mv.addObject("msg", message);
		mv.addObject("url", "/room.do");
		
		return mv;
	}
	
	/**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 */
	@RequestMapping("/getRoom.do")
	public @ResponseBody List<TRoom> getRoom(@RequestParam HashMap<Object, Object> params) {
		
		// 최초 룸리스트
		if(params.size() == 0) {
			params.put("category", "전체");
		}
		
		List<TRoom> list = chatService.selectRoomList(params);
		roomList = list;
		
		return list;
	}
	
	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChat.do")
	public ModelAndView chating(@RequestParam HashMap<String, Object> params, String gb) {
		ModelAndView mv = new ModelAndView();
		HashMap<String , Object> roomPwdCheck = new HashMap<String, Object>();
		HashMap<String , Object> pwdMap = new HashMap<String, Object>();
		String rowner = "";
		
		// 체크용 맵
		pwdMap.put("roomNumber", params.get("roomNumber").toString());
		
		// 공부시간 저장 후
		if(params.get("rowner") != null) {
			mv.addObject("rowner", params.get("rowner").toString());
		}
		
		if(gb == null) {
			// rowner 가져오기
			rowner = chatService.selectRowner(pwdMap);
			mv.addObject("rowner", rowner);

			roomPwdCheck = chatService.selectRoomPassword(pwdMap);
		
			// if 비번이 있으면 -> 비번 입력 창 -> if 비번이 맞으면 -> 입장 / else -> 비밀번호를 잘못 입력했습니다.
			if(roomPwdCheck.get("PASSWORD") != null) {
				// 비번 입력 창
				mv.addObject("roomNumber", params.get("roomNumber"));
				mv.addObject("roomName", params.get("roomName"));
				mv.setViewName("inputPwd");
			} 
			// 비번 없는 경우 바로 입장
			else {
				mv.addObject("roomNumber", params.get("roomNumber"));
				mv.addObject("roomName", params.get("roomName"));
				mv.setViewName("chat");
			}
		} else {
			mv.addObject("roomNumber", params.get("roomNumber"));
			mv.addObject("roomName", params.get("roomName"));
			mv.setViewName("chat");
		}
		
		return mv;
	}
	
	/**
	 * 채팅방 비번 입력 성공 했을 경우
	 * @return
	 */
	@RequestMapping("/moveChatSuccess.do")
	public ModelAndView chatingSuccess(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		HashMap<String , Object> checkMap = new HashMap<String, Object>();
		
		// 체크용 맵
		checkMap.put("roomNumber", params.get("roomNumber").toString());

		// rowner 가져오기
		String rowner = chatService.selectRowner(checkMap);
		
		mv.addObject("rowner", rowner);
		mv.addObject("roomNumber", params.get("roomNumber"));
		mv.addObject("roomName", params.get("roomName"));
		mv.setViewName("chat");
		
		return mv;
	}
	
	/**
	 * 채팅방 삭제하기
	 * @return
	 * **/
	@RequestMapping("/deleteRoom.do")
	public ModelAndView deleteRoom(@RequestParam String no) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/message");

		int result = 0; 
		String message = "";
		TRoom TRoom = null; 
	
		
		if(no == null && "".equals(no)) {
			message = "시스템오류";
		} else {

			TRoom = new TRoom();
			TRoom.setRno(Integer.parseInt(no));

			result = chatService.updateRoomInfo(TRoom);

			if(result < 1) {
				message = "시스템오류";
			} else {
				message = "삭제가 완료되었습니다.";
			}
		}
		
		mv.addObject("msg", message);

		return mv;
	}
	
	/**
	 * 채팅방 생성하기 페이지 이동
	 * @return
	 */
	@RequestMapping("/createRoomPage.do")
	public String createRoom() {
		return "createroom";
	}
	
	@RequestMapping("/inputPwd.do")
	public String moveinputPwd() {
		return "inputPwd";
	}
	
	/**
	 * 패스워드 체크
	 * @param params
	 * @return
	 */
	@RequestMapping("/pwdCheck.do")
	@ResponseBody
	public HashMap<String, Object> pwdCheck(@RequestParam HashMap<String, Object> params) {
		int result = 0;
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		result = chatService.selectPwdCheck(params);
		
		if(result > 0) {
			resultMap.put("roomNumber", params.get("roomNumber"));
			resultMap.put("roomName", params.get("roomName"));
			resultMap.put("page", "success");
		} else {
			resultMap.put("page", "message");
			resultMap.put("msg", "비밀번호가 잘못입력되었습니다");
		}
		
		return resultMap;
	}
	
}