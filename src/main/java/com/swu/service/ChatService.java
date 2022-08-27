package com.swu.service;

import java.util.HashMap;
import java.util.List;

import com.swu.vo.TRoom;

public interface ChatService {

	public List<HashMap<String, Object>> selectTest();

	public int insertRoomInfo(TRoom room);

	public List<TRoom> selectRoomList(HashMap<Object, Object> params);

	public int updateRoomInfo(TRoom room);

	public HashMap<String, Object> selectRoomPassword(HashMap<String , Object> params);

	public int selectPwdCheck(HashMap<String, Object> params);

	public String selectRowner(HashMap<String, Object> params);

}
