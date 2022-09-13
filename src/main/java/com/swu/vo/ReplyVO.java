package com.swu.vo;

import java.util.Date;

public class ReplyVO {
	
	/*
	 * CREATE TABLE swu_reply(
	 * rno int auto_increment not null comment '댓글번호',
	 * bno int not null comment '게시글 번호',
	 * writer varchar(50) not null comment '작성자',
	 * content varchar(2000) not null comment '내용',
	 * regdate timestamp not null default now() comment '작성일',
	 * del_yn varchar(1) default '0' comment '삭제여부',
	 * PRIMARY KEY (rno, bno) );
	 */
	
	/* 댓글 번호 */
	private int rno;
	
	/* 게시글 번호 */
	private int bno;
	
	/* 작성자 */
	private String writer;
	
	/* 내용 */
	private String content;
	
	/* 작성일 */
	private Date regdate;
	
	/* 삭제여부 */
	private int del_yn;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(int del_yn) {
		this.del_yn = del_yn;
	}
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", writer=" + writer + ", content=" + content + ", regdate="
				+ regdate + ", del_yn=" + del_yn + "]";
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
