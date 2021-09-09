package com.spring.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myapp.mapper.BoardMapper;
import com.spring.myapp.service.BoardService;
import com.spring.myapp.vo.MemberVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;

	@Override
	public List<MemberVO> member_list() throws Exception {
		List<MemberVO> member_list = boardMapper.member_list();
		return member_list;
	}

}
