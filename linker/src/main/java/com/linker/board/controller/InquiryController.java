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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.linker.board.dto.InquiryDto;
import com.linker.board.service.InquiryService;
import com.linker.login.dto.LoginDto;

@SessionAttributes("user")
@Controller
public class InquiryController {

	@Autowired
	InquiryService service;

	@ModelAttribute("user")
	public LoginDto getDto() {
		return new LoginDto();
	}

	@RequestMapping("/inquiry/inquiry")
	public String inquiry(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		// @RequestParam: 클라이언트에서 전송한 요청의 쿼리 파라미터 값을 매개변수로 받을 때 사용됨

		int count = service.count();
		if (count > 0) {
			int perPage = 10;
			int startRow = (page - 1) * perPage;

			List<InquiryDto> inquiryList = service.inquiryList(startRow);
			m.addAttribute("iList", inquiryList);

			int pageNum = 5; // 밑에 보여질 페이지 번호 갯수
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

			int begin = (page - 1) / pageNum * pageNum + 1; // 밑에 보여질 페이지 번호의 시작
			int end = begin + pageNum - 1; // 밑에 보여질 페이지 번호의 끝
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("start", startRow + 1);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
		}
		m.addAttribute("count", count);
		return "board/inquiry/inquiry";
	}

	@GetMapping("/inquiry/write")
	public String writeInquiry() {
		return "board/inquiry/write";
	}

	@PostMapping("/inquiry/write")
	public String writeinquiry(InquiryDto dto) {
		service.insertInquiry(dto);
		return "redirect:/inquiry/inquiry";
	}

	@GetMapping("/inquiry/writeComm")
	public String writeComm(@ModelAttribute("user") LoginDto userid, @ModelAttribute("dto") InquiryDto dto) {
		return "board/inquiry/writeComm";
	}

	@PostMapping("/inquiry/writeComm")
	public String writecomm(InquiryDto dto) {
		service.insertInquiry(dto);
		return "redirect:/inquiry/inquiry";
	}

	@GetMapping("/inquiry/content/{inquirypostid}")
	public String content(@ModelAttribute("user") LoginDto userid, @PathVariable int inquirypostid, Model m) {
		InquiryDto dto = service.inquiryOne(inquirypostid);
		m.addAttribute("dto", dto);
		return "board/inquiry/content";
	}

	@GetMapping("/inquiry/update/{inquirypostid}")
	public String updateForm(@PathVariable int inquirypostid, Model m) {
		InquiryDto dto = service.inquiryOne(inquirypostid);
		m.addAttribute("dto", dto);
		return "board/inquiry/updateform";
	}

	@PutMapping("/inquiry/update")
	public String update(InquiryDto dto) {
		service.updateInquiry(dto);
		return "redirect:/inquiry/inquiry";
	}

	@DeleteMapping("/inquiry/delete")
	@ResponseBody
	public String deleteInquiry(int inquirypostid) {
		int delete = service.deleteInquiry(inquirypostid);
		return "" + delete;
	}

	@GetMapping("/inquiry/search")
	public String search(int searchn, String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		System.out.println();
		int count = service.countSearch(searchn, search);
		// searchn, search을 기준으로 검색한 결과의 총 개수를 조회
		if (count > 0) {
			int perPage = 10;
			int startRow = (page - 1) * perPage; // 게시글 시작 순서
			int endRow = page * perPage; // 게시글 마지막 순서

			List<InquiryDto> inquiryList = service.inquiryListSearch(searchn, search, startRow);
			m.addAttribute("iList", inquiryList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
			m.addAttribute("end", end);
		}
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);

		return "board/inquiry/search";
	}

}
