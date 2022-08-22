package com.swu.mapper;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.swu.vo.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.swu.mapper.NoticeDAO";

	@Override
	public List<NoticeVO> nlist() throws Exception {
		
		return sql.selectList(namespace + ".list");
	}

	@Override
	public void nwrite(NoticeVO vo) throws Exception {
		
		sql.insert(namespace + ".write", vo);
		
	}

	@Override
	public NoticeVO nview(int n_num) throws Exception {
		
		return sql.selectOne(namespace + ".view", n_num);
	}

	@Override
	public void nmodify(NoticeVO vo) throws Exception {
		
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void ndelete(int n_num) throws Exception {
		sql.delete(namespace + ".delete", n_num);
		
	}

	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count");
	}
	
	// 게시물 목록 + 페이징
	@Override
	public List<NoticeVO> listPage(@Param("displayPost")int displayPost, @Param("postNum")int postNum) throws Exception {

	 HashMap<String, Integer> data = new HashMap<String, Integer>();
	  
	 data.put("displayPost", displayPost);
	 data.put("postNum", postNum);
	  
	 return sql.selectList(namespace + ".listPage", data);
	}
	
	// 게시물 목록 + 페이징 + 검색
	 @Override
	 public List<NoticeVO> listPageSearch(@Param("displayPost")int displayPost, @Param("postNum")int postNum, @Param("searchType")String searchType, @Param("keyword")String keyword) throws Exception {

	  HashMap<String, Object> data = new HashMap<String, Object>();
	  
	  data.put("displayPost", displayPost);
	  data.put("postNum", postNum);
	  
	  data.put("searchType", searchType);
	  data.put("keyword", keyword);
	  
	  return sql.selectList(namespace + ".listPageSearch", data);
	 }
	 
	// 게시물 총 갯수 + 검색 적용
	 @Override
	 public int searchCount(@Param("searchType")String searchType, @Param("keyword")String keyword) throws Exception {
	  
	  HashMap<String, Object> data = new HashMap<String, Object>();
	  
	  data.put("searchType", searchType);
	  data.put("keyword", keyword);
	  
	  return sql.selectOne(namespace + ".searchCount", data); 
	 }
}
