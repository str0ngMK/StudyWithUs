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

	@RequestMapping("/chat.do")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}

	/**
	 * 諛� �럹�씠吏�
	 * @return
	 */
	@RequestMapping("/room.do")
	public ModelAndView TRoom() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("room");
		return mv;
	}
	
	/**
	 * 諛� �깮�꽦�븯湲�
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom.do")
	public ModelAndView createRoom1(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/message");
		
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
			room.setCategory(category);
			room.setMaxUser(Integer.parseInt(userCount));
			
			if(pwdYn.equals("1")) {
				room.setPassword(pwd);
			}
			
			// 諛⑹젙蹂� DB���옣
			result = chatService.insertRoomInfo(room);
			
			// 諛� �븞留뚮뱾�뼱吏� 
			if(result < 1) {
				message = Constants.ERROR_MSG;
			} else {
				message = Constants.CREATE_ROOM_SUCCESS;
				roomList.add(room);
			}
		}
		
		mv.addObject("msg", message);
		
		return mv;
	}


	/**
	 * 諛� �깮�꽦�븯湲�
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
//			// 諛⑹젙蹂� DB���옣
//			result = chatService.insertRoomInfo(TRoom);
//			
//			// 諛� �븞留뚮뱾�뼱吏� 
//			if(result < 1) {
//				System.err.println("諛⑹븞留뚮뱾�뼱吏�");	
//			} else {
//				roomList.add(TRoom);
//			}
//			
//		}
//		return roomList;
//	}

	/**
	 * 諛� �젙蹂닿��졇�삤湲�
	 * @param params
	 * @return
	 */
	@RequestMapping("/getRoom.do")
	public @ResponseBody List<TRoom> getRoom(@RequestParam HashMap<Object, Object> params) {
		List<TRoom> list = chatService.selectRoomList(params);
		roomList = list;
		
		return list;
	}

	/**
	 * 梨꾪똿諛� �씠�룞 �쟾 泥댄겕
	 * @returnw
	 */
//	@RequestMapping("/moveChating.do")
//	@ResponseBody
//	public HashMap<String , Object> chating(@RequestParam HashMap<String, Object> params, TRoom room) {
//		HashMap<String , Object> map = new HashMap<String, Object>();
//		HashMap<String, Object> roomData = new HashMap<String, Object>();
//		
//		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
//		List<TRoom> new_list = roomList.stream().filter(o -> o.getRno() == roomNumber).collect(Collectors.toList());
//		
//		
//		if (new_list != null && new_list.size() > 0) {
//			
//			// 諛� 泥댄겕
//			roomData = chatService.roomPassword(params);
//			
//			if(roomData.get("PASSWORD") != null && !"".equals(roomData.get("PASSWORD"))){
//				map.put("pwdYn", "1");
//			} else {
//				map.put("pwdYn", "0");
//				map.put("roomData", params);
//				map.put("view", "chat");
//			}
//			
//		} else {
//			map.put("view", "room");
//		}
//		return map;
//	}
	
	/**
	 * 梨꾪똿諛⑹쑝濡� �럹�씠吏� �씠�룞
	 * @return
	 */
//	@RequestMapping("/moveChat.do")
//	public ModelAndView moveChat(@RequestParam HashMap<Object, Object> params) {
//		ModelAndView mv = new ModelAndView();
//		
//		mv.addObject("roomName", params.get("roomName"));
//		mv.addObject("roomNumber", params.get("roomNumber"));
//		
//		mv.setViewName("chat");
//		
//		return mv;
//	}
	
	/**
	 * 梨꾪똿諛�
	 * @return
	 */
	@RequestMapping("/moveChat.do")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		System.out.println(params.toString());
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
	 * 梨꾪똿諛� �궘�젣�븯湲�
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
			message = "�떆�뒪�뀥�삤瑜�";
		} else {

			TRoom = new TRoom();
			TRoom.setRno(Integer.parseInt(no));

			// 諛⑹젙蹂� DB���옣
			result = chatService.updateRoomInfo(TRoom);

			// 諛� �궘�젣 �떎�뙣
			if(result < 1) {
				message = "�떆�뒪�뀥�삤瑜�";
			} else {
				message = "�궘�젣媛� �셿猷뚮릺�뿀�뒿�땲�떎.";
			}
		}
		
		mv.addObject("msg", message);

		return mv;
	}
	
	/**
	 * 梨꾪똿諛� �깮�꽦�븯湲� �럹�씠吏� �씠�룞
	 * @return
	 */
	@RequestMapping("/createRoomPage.do")
	public String createRoom() {
		return "createroom";
	}
	
	/**
	 * 怨좉컼�꽱�꽣 �럹�씠吏� �씠�룞
	 * @return
	 */
	@RequestMapping("/serviceCenter.do")
	public String serviceCenter() {
		return "serviceCenter";
	}
	
	/**
	 * �뙣�뒪�썙�뱶 �럹�씠吏� �씠�룞
	 * @return
	 */
	@RequestMapping("/inputPwd.do")
	public String moveinputPwd() {
		return "inputPwd";
	}
	
	
	@RequestMapping("/submitTimer.do")
	public ModelAndView submitTimer(@RequestParam String rname, String rno, String time) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("roomName", rname);
		map.put("roomNumber", rno);
		System.out.println("방이름 = " + rname + ", 방번호 = " + rno + ", 시간= " + time );
		
		ModelAndView mv = chating(map);
		
		return mv;
	}
	
}