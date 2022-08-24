package com.swu.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
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

	@Override
	public int count() throws Exception {
		
		return dao.count();
	}
	
	// 게시물 목록 + 페이징
	@Override
	public List<NoticeVO> listPage(@Param("displayPost")int displayPost, @Param("postNum")int postNum) throws Exception {
	 return dao.listPage(displayPost, postNum);
	}
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<NoticeVO> listPageSearch(@Param("displayPost")int displayPost, @Param("postNum")int postNum, @Param("searchType")String searchType, @Param("keyword")String keyword) throws Exception {
		return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	// 게시물 총 갯수
	@Override
	public int searchCount(@Param("searchType")String searchType, @Param("keyword")String keyword) throws Exception {
	 return dao.searchCount(searchType, keyword);
	}

}
