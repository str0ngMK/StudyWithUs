package com.swu.mapper;

import java.util.List;

import com.swu.vo.BoardVO;
import com.swu.vo.Criteria;

public interface BoardMapper {
	
	/* 게시물 등록 */
	public void enroll(BoardVO board);
	
	/* 게시판 목록 읽어오기 */
    public List<BoardVO> getList();
    
    /* 게시물 상세화면 */
    public BoardVO getPage(int bno);
    
    /* 게시물 수정하기 */
    public int modify(BoardVO board);
    
    /* 게시물 삭제하기 */
    public int delete(int bno);
    
    /* 게시판 목록(페이징 적용) */
    public List<BoardVO> getListPaging(Criteria cri);
    
    /* 게시물 총 갯수 */
    public int getTotal(Criteria cri);
    
    /* 조회수 +1 */
	public void updateViewCnt(int bno);

	
}
