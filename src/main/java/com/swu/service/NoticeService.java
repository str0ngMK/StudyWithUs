package com.swu.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.swu.vo.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> nlist() throws Exception;
	
	public void nwrite(NoticeVO vo) throws Exception;
	
	public NoticeVO nview(int n_num) throws Exception;
	
	public void nmodify(NoticeVO vo) throws Exception;
	
	public void ndelete(int n_num) throws Exception;
	
	public int count() throws Exception;
	
	// 게시물 목록 페이징
	public List<NoticeVO> listPage(@Param("displayPost")int displayPost, @Param("postNum")int postNum) throws Exception;
	
	// 게시물 목록 + 페이징 + 검색
	 public List<NoticeVO> listPageSearch(@Param("displayPost")int displayPost, @Param("postNum")int postNum, @Param("searchType")String searchType, @Param("keyword")String keyword) throws Exception;
	 
	// 게시물 총 갯수 + 검색 적용
	 public int searchCount(@Param("searchType")String searchType, @Param("keyword")String keyword) throws Exception;
}
