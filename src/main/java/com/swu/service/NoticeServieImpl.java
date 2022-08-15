package com.swu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.swu.mapper.NoticeDAO;
import com.swu.vo.NoticeVO;

@Service
public class NoticeServieImpl implements NoticeService{
	
	@Inject
	private NoticeDAO dao;
	
	@Override
	public List<NoticeVO> nlist() throws Exception {
		
		return dao.nlist();
	}

	@Override
	public void nwrite(NoticeVO vo) throws Exception {
		
		dao.nwrite(vo);
	}

	@Override
	public NoticeVO nview(int n_num) throws Exception {
		
		return dao.nview(n_num);
	}

	@Override
	public void nmodify(NoticeVO vo) throws Exception {
		
		dao.nmodify(vo);
	}

	@Override
	public void ndelete(int n_num) throws Exception {
		dao.ndelete(n_num);
	}


}
