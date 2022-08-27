package com.swu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swu.mapper.ChatMapper;
import com.swu.vo.TRoom;

@Service(value = "chatService")
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatMapper mapper;
	
	@Override
	public List<HashMap<String, Object>> selectTest() {
		return mapper.selectTest();
	}

	@Override
	public int insertRoomInfo(TRoom room) {
		return mapper.insertRoomInfo(room);
	}

	@Override
	public List<TRoom> selectRoomList(HashMap<Object, Object> params) {
		return mapper.selectRoomList(params);
	}

	@Override
	public int updateRoomInfo(TRoom room) {
		return mapper.updateRoomInfo(room);
	}


	@Override
	public HashMap<String, Object> selectRoomPassword(HashMap<String , Object> params) {
		return mapper.roomPassword(params);
	}

	@Override
	public int selectPwdCheck(HashMap<String, Object> params) {
		return mapper.selectPwdCheck(params);
	}

	@Override
	public String selectRowner(HashMap<String, Object> params) {
		return mapper.selectRowner(params);
	}

}
