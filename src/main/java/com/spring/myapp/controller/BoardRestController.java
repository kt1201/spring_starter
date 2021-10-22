 package com.spring.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.myapp.service.BoardService;
import com.spring.myapp.vo.BoardVO;
import com.spring.myapp.vo.PagingVO;
import com.spring.myapp.vo.SearchVO;

@RestController
@RequestMapping("data")
public class BoardRestController {

	private Logger logger = LoggerFactory.getLogger(BoardRestController.class);

	@Autowired
	BoardService boardService;
	
	// 게시물 조회
	@RequestMapping(value = "/board", produces = "application/json; charset=utf8", method = RequestMethod.GET)
	public String getBoardList(SearchVO searchVO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int board_cnt = boardService.board_cnt(searchVO);  // 게시물 건수
		int nowPage = searchVO.getNowPage();  // 현재 페이지
		int cntPerPage = searchVO.getCntPerPage();  // 페이지당 게시물 수
		PagingVO pagingVO = new PagingVO(board_cnt, nowPage, cntPerPage);
		
		searchVO.setStart(pagingVO.getStart());  // 페이지당 시작지점
		List<BoardVO> board_list = boardService.board(searchVO);
		
		map.put("board_list", board_list); 
		map.put("paging", pagingVO);
		
		ObjectMapper mapper = new ObjectMapper();
		String data = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);

		return data;
	}
	

	// 게시물 등록
	@RequestMapping(value="/boardSubmit", produces ="application/json; charset=utf8", method = RequestMethod.POST)
	public void setBoardList(BoardVO boardVO) throws Exception {
		boardService.submit(boardVO);
	}
	
}
