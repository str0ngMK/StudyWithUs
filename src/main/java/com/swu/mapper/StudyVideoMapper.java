package com.swu.mapper;

import com.swu.vo.StudyVideo;

public interface StudyVideoMapper {
	
	public int insertUrl(StudyVideo video);

	public String selectUrl(StudyVideo sv);
}
