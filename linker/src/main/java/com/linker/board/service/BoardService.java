package com.linker.board.service;

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
	
	
}
