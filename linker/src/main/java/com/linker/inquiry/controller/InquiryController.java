package com.linker.inquiry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.linker.inquiry.dto.InquiryDto;
import com.linker.inquiry.service.InquiryService;
import com.linker.login.dto.LoginDto;

@SessionAttributes("user")
@Controller
public class InquiryController {

	@Autowired
	InquiryService service;
	
	@ModelAttribute("user")
	public InquiryDto getDto() {
		return new InquiryDto();
	}
	
	@RequestMapping("/inquiry/inquiry")
	public String inquiry(Model m) {
		
		List<InquiryDto> inquiryList = service.inquiryList(0);
		m.addAttribute("iList", inquiryList);
		return "inquiry/inquiry";
	}
	
	@GetMapping("/inquiry/write")
	public String writeInquiry() {
		return "inquiry/write";
	}
	
	@PostMapping("/inquiry/write")
	public String writeinquiry(InquiryDto dto){
		service.insertInquiry(dto);
		return "redirect:/inquiry/inquiry";
	}
	
	@GetMapping("/inquiry/content/{inquirypostid}")
	public String content(@ModelAttribute("user") LoginDto userid, @PathVariable int inquirypostid, Model m) {
	InquiryDto dto = service.inquiryOne(inquirypostid);
	m.addAttribute("dto", dto);
	return "inquiry/content";
	}
	
	@GetMapping("/inquiry/update/{inquirypostid}")
	public String updateForm(@PathVariable int inquirypostid, Model m) {
		InquiryDto dto = service.inquiryOne(inquirypostid);
		m.addAttribute("dto", dto);
		return "inquiry/updateform";
	}
	
	@PutMapping("/inquiry/update")
	public String update(InquiryDto dto) {
		service.updateInquiry(dto);
		return "redirect:/inquiry/inquiry";
	}
	
}
