package com.spring.myapp.service;

import java.util.List;

import com.spring.myapp.vo.MemberVO;

public interface BoardService {
	public List<MemberVO> member_list() throws Exception;
}
