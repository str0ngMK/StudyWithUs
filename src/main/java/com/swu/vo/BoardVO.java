package com.swu.vo;

import java.util.Date;

public class BoardVO {
	
	/* 게시판 번호 */
    private int bno;
    
    /* 게시판 제목 */
    private String title;
    
    /* 게시판 주제 */
    private int category;
    
    /* 게시판 내용 */
    private String content;
    
    /* 게시판 작가 */
    private String writer;
    
    /* 등록 날짜 */
    private Date regdate;
    
    /* 수정 날짜 */
    private Date updateDate;
    
    /* 조회수 */
    private int viewnum;
    
    /* 삭제여부 */
	private int del_yn;
	
	/* 신고수 */
	private int declaration;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getViewnum() {
		return viewnum;
	}

	public void setViewnum(int viewnum) {
		this.viewnum = viewnum;
	}

	public int getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(int del_yn) {
		this.del_yn = del_yn;
	}

	public int getDeclaration() {
		return declaration;
	}

	public void setDeclaration(int declaration) {
		this.declaration = declaration;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", category=" + category + ", content=" + content
				+ ", writer=" + writer + ", regdate=" + regdate + ", updateDate=" + updateDate + ", viewnum=" + viewnum
				+ ", del_yn=" + del_yn + ", declaration=" + declaration + "]";
	}
	
}
