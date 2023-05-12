package com.linker.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.notice.dao.NoticeDao;
import com.linker.notice.dto.NoticeDto;

@Service
public class NoticeService {

	@Autowired
	NoticeDao dao;
	
	public int insertNotice(NoticeDto dto) {
		return dao.insertNotice(dto);
	}
	
	public int updateNotice(NoticeDto dto) {
		System.out.println(dto);
		return dao.updateNotice(dto);
	}
	
	public int deleteNotice(int noticepostid) {
		return dao.deleteNotice(noticepostid);
		
	}
	
	public List<NoticeDto> noticeList(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.noticeList(m);
	}
	
	public NoticeDto boardOne(int no) {
		return dao.boardOne(no);
	}

	public int count() {
		return dao.count();
	}
	
	
}
