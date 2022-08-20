package com.swu.service;

import java.util.HashMap;
import java.util.List;

import com.swu.vo.TRoom;

public interface ChatService {

	public List<HashMap<String, Object>> selectTest();

	public int insertRoomInfo(TRoom room);

	public List<TRoom> selectRoomList(HashMap<Object, Object> params);

	public int UpdateRoomInfo(TRoom tRoom);

}
