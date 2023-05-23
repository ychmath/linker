package com.linker.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.linker.login.dto.EmailDto;
import com.linker.login.dto.LoginDto;
import com.linker.login.service.FindService;

@Controller
public class FindController {

	@Autowired
	FindService service;

	@GetMapping("/checkPassword")
	public String preUpdateForm() {
		return "login/preupdateform";
	}

	@PostMapping("/checkPassword")
	public String checkPassword(@RequestParam("currentPassword") String currentPassword,
			@ModelAttribute("user") LoginDto user, Model model) {
		boolean isPasswordCorrect = service.checkPassword(user.getUserid(), currentPassword);
		if (isPasswordCorrect) {
			return "redirect:/update";
		}
		model.addAttribute("errorMessage", "현재 비밀번호가 일치하지 않습니다.");
		return "login/preupdateform";
	}

	@GetMapping("/find-id")
	public String findIdForm() {
		return "login/findidform";
	}

	@PostMapping("/find-id")
	public String findId(LoginDto dto, Model model) {
		String userid = service.findId(dto);
		model.addAttribute("userid", userid);
		return "login/findidresultform";
	}


}
