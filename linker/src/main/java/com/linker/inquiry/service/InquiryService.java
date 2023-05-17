package com.linker.inquiry.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.linker.inquiry.dao.InquiryDao;
import com.linker.inquiry.dto.InquiryDto;

@Service
public class InquiryService {

	@Autowired
	InquiryDao dao;

	@Transactional 
	/*DML문이 발생할 때 DB 트랜잭션을 시작하고, 해당 작업이 성공적으로 완료되면 트랜잭션을 커밋하며
	*작업 도중 오류가 발생하면 트랜잭션을 롤백하는 과정을 말함
	*/
	public void insertInquiry(InquiryDto dto) {
		if(dto.getRef()==0) { //제목글
			//System.out.println(dto);
			dao.insertInquiry(dto);
			dao.updateRef(dto.getInquirypostid());
		}
		else { //답글
			dto.setRestep(dto.getRestep()+1);
			//restep값을 1 증가시켜서 현재 답글이 부모글 이후의 답글이 되도록 설정함
			dto.setRelevel(dto.getRelevel()+1);
			//relevel값을 1 증가시켜서 부모글(ref)의 relevel 값보다 작은 값이 되도록 설정 
			dao.insertInquiry(dto);
			
		}
	}
	
	public int updateInquiry(InquiryDto dto) {
		return dao.updateInquiry(dto);
	}
	
	public int deleteInquiry(int inquirypostid) {
		return dao.deleteInquiry(inquirypostid);
	}
	
	public List<InquiryDto> inquiryList(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.inquiryList(m);
	}
	
	public InquiryDto inquiryOne(int inquirypostid) {
		return dao.inquiryOne(inquirypostid);
	}
	
	public int count() {
		return dao.count();
	}
	
	public List<InquiryDto> inquiryListSearch(int searchn, String search, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		//검색 유형을 지정하는데 사용
		//글 제목으로 검색할 경우 0을, 작성자로 검색할 경우 1을 전달
		m.put("search", search);
		//전달받은 검색 유형에 따라 제목이나 작성자의 이름을 전달
		m.put("start", start);
		//검색 결과를 몇 번째부터 조회할지를 지정. 페이징 처리를 하기 위한 변수
		m.put("count", 10);
		return dao.inquiryListSearch(m);
		
		//m.addAttribute() (model.addAttribute()) -> Model을 주로 작업
		//m.put (map.put()) -> Controller에서 작업
	}
	
	public int countSearch(int searchn, String search) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}
	
}

