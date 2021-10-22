package com.spring.myapp.vo;

public class SearchVO { //VO를 굳이 table 이랑 같지 않아도 ㅇㅇㅇ
	private String searchkey; //검색조건
	private String searchword; //검색어
	private int nowPage; // 현재 페이지
	private int start; // 시작지점
	private int cntPerPage; // 페이지당 게시물 수
	
	public String getSearchword() {
		return searchword;
	}
	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}
	public String getSearchkey() {
		return searchkey;
	}
	public void setSearchkey(String searchkey) {
		this.searchkey = searchkey;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
}
