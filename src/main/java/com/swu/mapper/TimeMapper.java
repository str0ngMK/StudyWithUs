package com.swu.mapper;

import java.util.HashMap;
import java.util.List;

import com.swu.vo.TStudy;

public interface TimeMapper {

	public HashMap<String, Object> selectStudyTime(TStudy study);
	
	public int updateStudyTime(TStudy study);
	
	public int insertStudyTime(TStudy study);

	public List<TStudy> selectRanking(HashMap<Object, Object> params);

}
