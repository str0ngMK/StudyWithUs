package com.swu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swu.mapper.TimeMapper;
import com.swu.vo.TStudy;

@Service(value = "timeService")
public class TimeServiceImpl implements TimeService {

	@Autowired
	private TimeMapper mapper;
	
	@Override
	public HashMap<String, Object> selectStudyTime(TStudy study) {
		return mapper.selectStudyTime(study);
	}

	@Override
	public int updateStudyTime(TStudy study) {
		return mapper.updateStudyTime(study);
	}

	@Override
	public int insertStudyTime(TStudy study) {
		return mapper.insertStudyTime(study);
	}

	@Override
	public List<TStudy> selectRanking(HashMap<Object, Object> params) {
		return mapper.selectRanking(params);
	}

}
