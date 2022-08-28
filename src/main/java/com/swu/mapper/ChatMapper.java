package com.swu.mapper;

import java.util.HashMap;
import java.util.List;

import com.swu.vo.TRoom;

public interface ChatMapper {

	public List<HashMap<String, Object>> selectTest();

	public int insertRoomInfo(TRoom room);

	public List<TRoom> selectRoomList(HashMap<Object, Object> params);
	
	public int updateRoomInfo(TRoom room);

	public HashMap<String, Object> roomPassword(HashMap<String, Object> params);

	public int selectPwdCheck(HashMap<String, Object> params);

	public String selectRowner(HashMap<String, Object> params);
	
}
