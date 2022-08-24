package com.swu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swu.mapper.BoardMapper;
import com.swu.vo.BoardVO;
import com.swu.vo.Criteria;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	/* 게시물 작성 */
	@Override
	public void enroll(BoardVO board) {
		mapper.enroll(board);
	}
	
	/* 게시판 목록 읽어오기 */
	@Override
    public List<BoardVO> getList() {
        return mapper.getList();
    }
	
	/* 게시물 상세화면 */
    @Override
    public BoardVO getPage(int bno) {
    	mapper.updateViewCnt(bno);
        return mapper.getPage(bno);
    }
    
    /* 게시물 수정하기 */
    @Override
    public int modify(BoardVO board) {
        return mapper.modify(board);
    }
    
    /* 게시물 삭제하기 */
    @Override
    public int delete(int bno) {
        return mapper.delete(bno);
    }
	
    /* 게시판 목록(페이징 적용) */
    @Override
    public List<BoardVO> getListPaging(Criteria cri) {
        return mapper.getListPaging(cri);
    }
    
    /* 게시물 총 갯수 */
    @Override
    public int getTotal(Criteria cri) {
        return mapper.getTotal(cri);
    }
    
    /* 조회수 +1 */
	@Override
	public void updateViewCnt(int bno) {
		mapper.updateViewCnt(bno);
	}


}
