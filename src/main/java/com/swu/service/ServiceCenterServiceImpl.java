package com.swu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swu.mapper.ServiceCenterMapper;
import com.swu.vo.TServiceCenter;

@Service(value = "serviceCenterService")
public class ServiceCenterServiceImpl implements ServiceCenterService {

	@Autowired
	private ServiceCenterMapper mapper;
	
	@Override
	public int insertService(TServiceCenter tsc) {
		return mapper.insertService(tsc);
	}

	@Override
	public List<TServiceCenter> serviceList() throws Exception {
		return mapper.serviceList();
	}

}
