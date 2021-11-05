package com.spring.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.myapp.vo.BoardVO;
import com.spring.myapp.vo.SearchVO;

@Mapper
public interface BoardMapper {
	//게시물 조회
	public List<BoardVO> board(SearchVO searchVO) throws Exception;
	
	//게시물 건수
	public int board_cnt(SearchVO searchVO) throws Exception;
	
	//게시물 등록
	public void insert(BoardVO boardVO) throws Exception;

	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	// id 해당 게시물
	public BoardVO getOneBoard(int id) throws Exception;
}
