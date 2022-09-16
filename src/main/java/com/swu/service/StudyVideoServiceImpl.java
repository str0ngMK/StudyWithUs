package com.swu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swu.mapper.StudyVideoMapper;
import com.swu.vo.StudyVideo;

@Service(value = "studyVideoService")
public class StudyVideoServiceImpl implements StudyVideoService {
	
	@Autowired
	private StudyVideoMapper mapper;
	
	@Override
	public int insertUrl(StudyVideo video) {
		return mapper.insertUrl(video);
	}

	@Override
	public String slectUrl(StudyVideo sv) {
		return mapper.selectUrl(sv);
	}

}
