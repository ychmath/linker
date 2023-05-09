package com.linker.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.linker.login.dto.LoginDto;
import com.linker.login.service.LoginService;

@Controller
@SessionAttributes("user")
public class LoginController {
	@Autowired
	LoginService service;
	
	@ModelAttribute("user")
	public LoginDto getDto() {
		return new LoginDto();
	}
	
	@GetMapping("/insert")
	public String joinform() {
		return "Login/joinform";
	}
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(String id) {
		String checkid = service.idCheck(id);
		return checkid;
	}
	
	@PostMapping("/insert")
	public String insert(LoginDto dto) {
		service.insertMem(dto);
		return "redirect:loginform";
	}
	@GetMapping("/loginform")
	public String loginform() {
		return "Login/loginform";
	}
	@PostMapping("/login")
	public String login(@ModelAttribute("command") @Validated LoginDto dto, BindingResult error, Model m) {
		System.out.println(dto);
		
		
		if(error.hasErrors()) {
			return "Login/loginform";
		}
		LoginDto resultDto = service.login(dto);
		if(resultDto == null) {
			error.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀림");	
			return "Login/loginform";
		}else {//로그인 성공
			m.addAttribute("user", resultDto);
		}
		return "redirect:/main";
	}
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("/update")
	public String updateform(@ModelAttribute("user") LoginDto dto) {
		return "Login/updateform";
	}
	@PutMapping("/update")
	public String update(@ModelAttribute("user") LoginDto dto) {
		service.updateMem(dto);
		return "redirect:/main";
	}
	@GetMapping("/delete")
	public String deleteform(String result, Model m) {
		m.addAttribute("result",result);
		return "Login/deleteform";
	}
	@DeleteMapping("/delete")
	public String delete(String formpw, @ModelAttribute("user") LoginDto dto, SessionStatus status) {
	
		int i = service.deleteMem(formpw, dto);
		if(i == 0) {
			return "redirect:/delete?result=false";
		}else {
			status.setComplete();
			return "redirect:/main";
		}
	}
	@RequestMapping("/main")
	public String main(@ModelAttribute("user") LoginDto dto) {
		if(dto.getId() != null) {
			return "Login/main";
		}else {
			return "Login/loginform";
		}
	}
}
