package com.linker.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@GetMapping("/findpw")
	public String findPwForm() {
	    return "login/findpwform";
	}

	@PostMapping("/findpw")
	public String findPw(@RequestParam("userid") String userid, @RequestParam("email") String email, Model model) {
	    String newPassword = service.findPassword(userid, email);

	    if (newPassword != null) {
	        model.addAttribute("message", "임시 비밀번호가 발급되었습니다. 이메일을 확인해주세요.");
	        model.addAttribute("success", true);
	    } else {
	        model.addAttribute("message", "해당 계정으로 가입된 아이디와 이메일이 없습니다. 다시 입력해주세요.");
	        model.addAttribute("success", false);
	    }
	    return "login/findpwform";
	}
}
