package com.swu.service;

import java.util.List;

import com.swu.vo.TServiceCenter;

public interface ServiceCenterService {

	public int insertService(TServiceCenter tsc);
	
	public List<TServiceCenter> serviceList() throws Exception;

}
