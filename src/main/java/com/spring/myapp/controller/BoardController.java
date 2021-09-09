package com.spring.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.myapp.service.BoardService;

@Controller
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService boardService;

//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public void getList() throws Exception {
//		List<MemberVO> member_list = boardService.member_list();
//		
//	}
}