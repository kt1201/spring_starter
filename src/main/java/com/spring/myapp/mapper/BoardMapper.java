package com.spring.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.myapp.vo.MemberVO;

@Mapper
public interface BoardMapper {
	public List<MemberVO> member_list() throws Exception;
}
