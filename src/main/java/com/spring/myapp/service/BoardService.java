package com.spring.myapp.service;

import java.util.List;

import com.spring.myapp.vo.BoardVO;
import com.spring.myapp.vo.SearchVO;

public interface BoardService {
	
	//게시물 조회
	public List<BoardVO> board(SearchVO searchVO) throws Exception;
	
	//게시물 건수
	public int board_cnt(SearchVO searchVO) throws Exception;
	
	//게시물 등록
	public void insert(BoardVO boardVO) throws Exception;

	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
}
