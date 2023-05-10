package com.linker.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.linker.board.dto.BoardDto;
import com.linker.board.service.BoardService;



@Controller
public class BoardController {

	@Autowired
	BoardService service;
	
	@RequestMapping("/notice/notice")
	public String notice(BoardDto dto) {
		return "notice/notice";
	}
	
	@GetMapping("/notice/write")
	public String write1() {
		return "notice/write";
	}
	
	@PostMapping("/notice/write")
	public String writeNotice(BoardDto dto) {
		service.insertNotice(dto);
		return "redirect:/notice/write";
	}
	
	@RequestMapping("/inquiry/inquiry")
	public String inquiry(BoardDto dto) {
		return "inquiry/inquiry";
	}
	
	@GetMapping("/inquiry/write")
	public String write2() {
		return "inquiry/write";
	}
	
	@PostMapping("/inquiry/write")
	public String writeInquiry(BoardDto dto) {
		return "redirect:/inquiry/write";
	}
	
	
	
	
	
	
	
	
}
