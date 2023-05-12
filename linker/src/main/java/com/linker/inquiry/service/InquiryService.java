package com.linker.inquiry.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.inquiry.dao.InquiryDao;
import com.linker.inquiry.dto.InquiryDto;

@Service
public class InquiryService {

	@Autowired
	InquiryDao dao;
	
	public int insertInquiry(InquiryDto dto) {
		System.out.println(dto);
		return dao.insertInquiry(dto);
	}
	
	public int updateInquiry(InquiryDto dto) {
		return dao.updateInquiry(dto);
	}
	
	public int deleteInquiry(int inquirypostid) {
		return dao.deleteInquiry(inquirypostid);
	}
	
	public List<InquiryDto> inquiryList(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		return dao.inquiryList(m);
	}
	
	public InquiryDto inquiryOne(int inquirypostid) {
		return dao.inquiryOne(inquirypostid);
	}
	
	
}

