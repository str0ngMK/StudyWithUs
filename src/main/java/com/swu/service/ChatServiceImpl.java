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
	public List<TRoom> selectRoomList() {
		return mapper.selectRoomList();
	}

	@Override
	public int UpdateRoomInfo(TRoom room) {
		return mapper.updateRoomInfo(room);
	}

}
