package com.linker.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.linker.board.dto.BoardDto;
import com.linker.board.service.BoardService;
import com.linker.login.dto.LoginDto;

@SessionAttributes("user")
@Controller
public class BoardController{

	@Autowired
	BoardService service;
	
	@ModelAttribute("user")
	public BoardDto getDto() {
		return new BoardDto();
	}
	
	@RequestMapping("/notice/notice")
	public String notice(BoardDto dto, Model m) {
		List<BoardDto> noticeList = service.noticeList(0);
		m.addAttribute("nList", noticeList);
		//Model 객체에 nList라는 이름으로 추가
		//이렇게 추가된 속성은 JSP페이지에서 사용할 수 있음
		return "notice/notice";
	}
	
	@GetMapping("/notice/write")
	public String writeNotice() {
		return "notice/write";
	}
	
	@PostMapping("/notice/write")
	public String writenotice(BoardDto dto) {
		service.insertNotice(dto);
		return "redirect:/notice/notice";
	}
	
	@GetMapping("/notice/content/{noticepostid}")
	public String content(@ModelAttribute("user") LoginDto userid, @PathVariable int noticepostid, Model m) {
		//"user"라는 이름으로 LoginDto 타입의 객체를 model에 추가함 -> jsp에서 해당 객체를 사용할 수 있게 해줌
		//@PathVariable int noticepostid: 경로 변수인 {noticepostid}의 값을 int 타입의 noticepostid 변수에 매핑함. 즉, URL에서 해당 위치의 값을 추출하여 noticepostid 변수에 할당
		BoardDto dto = service.boardOne(noticepostid);
		m.addAttribute("dto", dto);
		return "notice/content";
	}
	
	@GetMapping("/notice/update/{noticepostid}")
	public String updateForm(@PathVariable int noticepostid, Model m) {
		BoardDto dto = service.boardOne(noticepostid);
		m.addAttribute("dto", dto);
		return "notice/updateform";
	}
	
	@PutMapping("/notice/update")
	//@PutMapping: 클라이언트가 서버에게 업데이트할 데이터를 제공하고, 해당 데이터로 리소스를 생긴하거나 새로 만듦
	public String update(BoardDto dto) {
		service.updateNotice(dto);
		return "redirect:/notice/notice";
	}
	
	
	@DeleteMapping("/notice/delete")
	@ResponseBody
	//@ResponseBody: 메소드의 반환 값을 직접 HTTP 응답의 본문으로 전송할 수 있음 -> 반환 값은 문자열로 전송됨
	public String deleteNotice(int noticepostid) {
		//메소드의 반환 타입이 String이기 때문에 데이터 타입은 String
		int delete = service.deleteNotice(noticepostid);
		return "" + delete;
	}
	
	@RequestMapping("/inquiry/inquiry")
	public String inquiry(BoardDto dto) {
		return "inquiry/inquiry";
	}
	
	@GetMapping("/inquiry/write")
	public String writeInquiry() {
		return "inquiry/write";
	}
	
	@PostMapping("/inquiry/write")
	public String writeinquiry(BoardDto dto) {
		return "redirect:/inquiry/inquiry";
	}
	
	
	
	
	
	
	
	
	
	
}
