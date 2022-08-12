package com.swu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.swu.common.Constants;
import com.swu.service.ChatService;
import com.swu.vo.TRoom;

@Controller
public class ChatController {
	
	@Resource(name = "chatService")
	private ChatService chatService;
	
	List<TRoom> roomList = new ArrayList<TRoom>();
	static int roomNumber = 0;

	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}

	/**
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room")
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
	@RequestMapping("/createRoom1")
	public ModelAndView createRoom1(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/message");
		
		TRoom tRoom = new TRoom();
		
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
			
			tRoom.setRname(roomName);
			tRoom.setCategory(category);
			tRoom.setMaxUser(Integer.parseInt(userCount));
			
			if(pwdYn.equals("1")) {
				tRoom.setPassword(pwd);
			}
			
			// 방정보 DB저장
			result = chatService.insertRoomInfo(tRoom);
			
			// 방 안만들어짐 
			if(result < 1) {
				message = Constants.ERROR_MSG;
			} else {
				message = Constants.CREATE_ROOM_SUCCESS;
				roomList.add(tRoom);
			}
		}
		
		mv.addObject("msg", message);
		
		return mv;
	}


	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
//	@RequestMapping("/createRoom")
//	public @ResponseBody List<TRoom> createRoom(@RequestParam HashMap<Object, Object> params) {
//		String roomName = (String) params.get("roomName");
//		String category = (String) params.get("category");
//		int result = 0;
//		
//		if (roomName != null && !roomName.trim().equals("") && category != null) {
//			TRoom TRoom = new TRoom();
//			TRoom.setRname(roomName);
//			
//			// 방정보 DB저장
//			result = chatService.insertRoomInfo(TRoom);
//			
//			// 방 안만들어짐 
//			if(result < 1) {
//				System.err.println("방안만들어짐");	
//			} else {
//				roomList.add(TRoom);
//			}
//			
//		}
//		return roomList;
//	}

	/**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 */
	@RequestMapping("/getRoom")
	public @ResponseBody List<TRoom> getRoom(@RequestParam HashMap<Object, Object> params) {
		List<TRoom> list = chatService.selectRoomList();
		roomList = list;
		return roomList;
	}

	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));

		List<TRoom> new_list = roomList.stream().filter(o -> o.getRno() == roomNumber)
				.collect(Collectors.toList());
		if (new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber"));
			mv.setViewName("chat");
		} else {
			mv.setViewName("TRoom");
		}
		return mv;
	}
	
	/**
	 * 채팅방 삭제하기
	 * @return
	 * **/
	@RequestMapping("/deleteRoom")
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

			// 방정보 DB저장
			result = chatService.UpdateRoomInfo(TRoom);

			// 방 삭제 실패
			if(result < 1) {
				message = "시스템오류";
			} else {
				message = "삭제가 완료되었습니다.";
			}
		}
		
		mv.addObject("msg", message);

		return mv;
	}
	
	// TestSelect (임시)
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		List<HashMap<String, Object>> testList = chatService.selectTest();
		mv.addObject("list", testList);
		return mv;
	}
	
	@RequestMapping("/createRoomPage")
	public String createRoom() {
		return "createroom";
	}
	
}