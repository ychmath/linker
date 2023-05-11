package com.linker.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.board.dao.BoardDao;
import com.linker.board.dto.BoardDto;

@Service
public class BoardService {

	@Autowired
	BoardDao dao;
	
	public int insertNotice(BoardDto dto) {
		return dao.insertNotice(dto);
	}
	
	public int updateNotice(BoardDto dto) {
		System.out.println(dto);
		return dao.updateNotice(dto);
	}
	
	public int deleteNotice(int noticepostid) {
		return dao.deleteNotice(noticepostid);
		
	}
	
	public List<BoardDto> noticeList(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.noticeList(m);
	}
	
	public BoardDto	boardOne(int no) {
		return dao.boardOne(no);
	}

}
