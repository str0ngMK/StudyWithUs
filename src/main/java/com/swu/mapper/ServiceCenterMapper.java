package com.swu.mapper;

import java.util.List;

import com.swu.vo.TServiceCenter;

public interface ServiceCenterMapper {

	public int insertService(TServiceCenter tsc);
	
	public List<TServiceCenter> serviceList() throws Exception;
}
