package com.swu.vo;

public class Page {
	
	// 현재 페이지 번호
	private int num;
	// 게시물 총 갯수
	private int count;
	//한 페이지에 출력할 게시물 갯수
	private int postNum;
	private int pageNum;
	private int displayPost;
	private int pageNumCnt = 10;
	private int endPageNum;
	private int startPageNum;
	
	private boolean prev;
	private boolean next;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPostNum() {
		return postNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public int getDisplayPost() {
		return displayPost;
	}
	public int getPageNumCnt() {
		return pageNumCnt;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
}
