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
import com.spring.myapp.vo.MemberVO;

@RestController
@RequestMapping("data")
public class BoardRestController {

	private Logger logger = LoggerFactory.getLogger(BoardRestController.class);

	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/list", produces = "application/json; charset=utf8", method = RequestMethod.GET)
	public String getList() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<MemberVO> member_list = boardService.member_list();
		map.put("member_list", member_list);
		
		ObjectMapper mapper = new ObjectMapper();
		String data = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);

		return data;
	}
}
