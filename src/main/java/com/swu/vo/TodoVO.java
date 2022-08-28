package com.swu.vo;

public class TodoVO {
	
	private int idx;
	private String id;
	private String contents;
	private String complete_yn;
	
	public TodoVO() {
		
	}
	
	public TodoVO(int idx, String id, String contents, String complete_yn) {
		super();
		this.idx = idx;
		this.id = id;
		this.contents = contents;
		this.complete_yn = complete_yn;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getComplete_yn() {
		return complete_yn;
	}

	public void setComplete_yn(String complete_yn) {
		this.complete_yn = complete_yn;
	}

	@Override
	public String toString() {
		return "TodoVO [idx=" + idx + ", id=" + id + ", contents=" + contents + ", complete_yn=" + complete_yn + "]";
	}
	
	
	
}
