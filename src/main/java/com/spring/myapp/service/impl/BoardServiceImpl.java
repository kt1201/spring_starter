package com.spring.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myapp.mapper.BoardMapper;
import com.spring.myapp.service.BoardService;
import com.spring.myapp.vo.BoardVO;
import com.spring.myapp.vo.SearchVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;

	@Override // 데이터 가져오기
	public List<BoardVO> board(SearchVO searchVO) throws Exception {
		List<BoardVO> board = boardMapper.board(searchVO);

		return board;
	}
	
	@Override
	public int board_cnt(SearchVO searchVO) throws Exception {
		int board_cnt = boardMapper.board_cnt(searchVO);
		return board_cnt;
	}

	@Override
	public void insert(BoardVO boardVO) throws Exception {
		boardMapper.insert(boardVO);
	}
	
	@Override
	public void update(BoardVO boardVO) throws Exception {
		boardMapper.update(boardVO);
	}

	@Override
	public BoardVO getOneBoard(int id) throws Exception {
		BoardVO vo = boardMapper.getOneBoard(id);
		return vo;
	}

}
