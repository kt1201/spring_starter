package com.spring.myapp.controller;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myapp.service.BoardService;
import com.spring.myapp.vo.BoardVO;

@Controller
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService boardService;
	
	@Value("${file.upload.path}")
	private String uploadPath;
	

	@RequestMapping(value ="/", method = RequestMethod.GET)
	public String board(Model model) throws Exception{
		
		return "board";
	}
	
	// 게시물 등록
	@RequestMapping(value="/insert", produces ="application/json; charset=utf8", method = RequestMethod.POST)
	public String insert(BoardVO boardVO, MultipartFile file) throws Exception {
		String fileName = file.getOriginalFilename();
		File target = new File(uploadPath, fileName);
		
		boardService.insert(boardVO);
		return "redirect:/";
	}
	
	// 게시물 수정
	@RequestMapping(value ="/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception{
		boardService.update(boardVO);
		return "redirect:/";
	}
}