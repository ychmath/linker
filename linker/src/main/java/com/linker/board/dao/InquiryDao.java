package com.linker.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.board.dto.InquiryDto;

@Mapper
public interface InquiryDao {

	public int insertInquiry(InquiryDto dto);
	
	public int updateInquiry(InquiryDto dto);
	
	public int updateRef(int inquirypostid);
	
	public int updateStep(InquiryDto dto);
	//후속 댓글들이 이전 댓글보다 아래쪽에 위치하도록 하기 위해서, 해당 개시물의 restep 값을 1 증가시키는 것
	
	public int updateReadcount(int inquirypostid);
	
	public int deleteInquiry(int inquirypostid);
	
	List<InquiryDto> inquiryList(Map<String, Object> m);
	
	public InquiryDto inquiryOne(int inquirypostid);
	
	public int count();
	
	List<InquiryDto> inquiryListSearch(Map<String, Object> m);

	int countSearch(Map<String, Object> m); //검색 글 갯수
	
}
