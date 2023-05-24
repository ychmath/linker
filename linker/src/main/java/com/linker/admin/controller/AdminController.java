package com.linker.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.linker.admin.dto.AdminDto;
import com.linker.admin.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService service;
	
	// 경로 return, 대시보드 정보 가져오기
	@GetMapping("/admin")
	public String adminPage(Model m) {
		// 각 리스트 수
		int userCount = service.userCount();
		int inquiryCount = service.inquiryCount();
		int noticeCount = service.noticeCount();
		
		// 가져 올 최신 목록
		List<AdminDto> userList = service.userList(0);
		List<AdminDto> inquiryList = service.inquiryList(0);
		List<AdminDto> noticeList = service.noticeList(0);
		
		// model 저장
		m.addAttribute("userCount", userCount);
		m.addAttribute("inquiryCount", inquiryCount);
		m.addAttribute("noticeCount", noticeCount);
		
		m.addAttribute("userList", userList);
		m.addAttribute("inquiryList", inquiryList);
		m.addAttribute("noticeList", noticeList);
		
		return "admin/main";
	}
	
	// user 리스트 출력, 관리
	@GetMapping("/admin/user")
	public String userManage(@RequestParam(name = "p", defaultValue = "1")int page, Model m) {
		int userCount = service.userCount();
		
		if(userCount > 0) {
			int perPage = 5;
			int startRow = (page -1) * perPage;
			
			List<AdminDto> userList = service.userList(startRow);
			
			m.addAttribute("userList", userList);
			
			  int pageNum = 5;
			  int totalPages = userCount / perPage + (userCount % perPage > 0 ? 1 : 0); // 전체 페이지 수
			  int begin = (page - 1) / pageNum * pageNum + 1;
			  int end = begin + pageNum - 1;
		  
			  if (end > totalPages) {
				  end = totalPages;
			  }
			
			  m.addAttribute("begin", begin);
			  m.addAttribute("end", end);
			  m.addAttribute("pageNum", pageNum);
			  m.addAttribute("totalPages", totalPages);
			
		}
		
		m.addAttribute("userCount", userCount);
		
		return "admin/user";

	}

	// 사용자 삭제
	@DeleteMapping("/admin/user/delete/{userid}")
	@ResponseBody
	public String deleteUser(@PathVariable String userid) {
		service.deleteUser(userid);
		return "/admin/user";
	}
	
	// 문의글 리스트 출력
	@GetMapping("/admin/inquiry")
	public String inquiryManage(@RequestParam(name = "p", defaultValue = "1")int page, Model m){
		int inquiryCount = service.inquiryCount();
		
		if(inquiryCount > 0) {
			int perPage = 5;
			int startRow = (page -1) * perPage;
			
			List<AdminDto> inquiryList = service.inquiryList(startRow);
			
			m.addAttribute("inquiryList", inquiryList);
			
			  int pageNum = 5;
			  int totalPages = inquiryCount / perPage + (inquiryCount % perPage > 0 ? 1 : 0); // 전체 페이지 수
			  int begin = (page - 1) / pageNum * pageNum + 1;
			  int end = begin + pageNum - 1;
		  
			  if (end > totalPages) {
				  end = totalPages;
			  }
			
			  m.addAttribute("begin", begin);
			  m.addAttribute("end", end);
			  m.addAttribute("pageNum", pageNum);
			  m.addAttribute("totalPages", totalPages);
			
		}
		
		m.addAttribute("inquiryCount", inquiryCount);

		return "admin/inquiry";
	}
	
	// 문의글 상세 정보 확인
	@GetMapping("admin/inquiryContent/{inquirypostid}")
	public String inquiryContent(@PathVariable int inquirypostid, Model m) {
		AdminDto dto = service.getInquiry(inquirypostid);
		m.addAttribute("dto", dto);
		return "admin/inquiryContent";
	}
	
	// 문의글 삭제
	@DeleteMapping("/admin/inquiry/delete/{inquirypostid}")
	@ResponseBody
	public String deleteInquiry(@PathVariable int inquirypostid) {
		service.deleteInquiry(inquirypostid);
		return "../inquiry";
	}
	
	// 공지사항 목록 확인
	@GetMapping("admin/notice")
	public String noticeManage(@RequestParam(name = "p", defaultValue = "1")int page, Model m) {
		int noticeCount = service.noticeCount();
		
		if(noticeCount > 0) {
			int perPage = 5;
			int startRow = (page -1) * perPage;
			
			List<AdminDto> noticeList = service.noticeList(startRow);
			
			m.addAttribute("noticeList", noticeList);
			
			  int pageNum = 5;
			  int totalPages = noticeCount / perPage + (noticeCount % perPage > 0 ? 1 : 0); // 전체 페이지 수
			  int begin = (page - 1) / pageNum * pageNum + 1;
			  int end = begin + pageNum - 1;
		  
			  if (end > totalPages) {
				  end = totalPages;
			  }

			  m.addAttribute("begin", begin);
			  m.addAttribute("end", end);
			  m.addAttribute("pageNum", pageNum);
			  m.addAttribute("totalPages", totalPages);
			
		}
		
		m.addAttribute("noticeCount", noticeCount);
		
		return "admin/notice";
	}
	
	// 공지사항 상세 정보 확인
	@GetMapping("admin/noticeContent/{noticepostid}")
	public String noticeContent(@PathVariable int noticepostid, Model m) {
		AdminDto dto = service.getNotice(noticepostid);
		m.addAttribute("dto", dto);
		return "admin/noticeContent";
	}
	
	// 공지사항 게시글 삭제
	@DeleteMapping("/admin/notice/delete/{noticepostid}")
	@ResponseBody
	public String deleteNotice(@PathVariable int noticepostid) {
		service.deleteNotice(noticepostid);
		return "../notice";
	}

}