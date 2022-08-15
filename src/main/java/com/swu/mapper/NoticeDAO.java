package com.swu.mapper;

import java.util.List;

import com.swu.vo.NoticeVO;

public interface NoticeDAO {
	
	public List<NoticeVO> nlist() throws Exception;
	
	public void nwrite(NoticeVO vo) throws Exception;
	
	public NoticeVO nview(int n_num) throws Exception;
	
	public void nmodify(NoticeVO vo) throws Exception;
	
	//게시물 삭제
	public void ndelete(int n_num) throws Exception;
}
