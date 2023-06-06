package com.linker.login.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.linker.login.dto.LoginDto;
import com.linker.login.service.LoginService;

import jakarta.validation.Valid;

@Controller
@SessionAttributes("user") // 세션에 객체를 저장하기 위한 어노테이션
public class LoginController {

	@Autowired
	LoginService service;

	// 서버 시작시 처음으로 나타나는 페이지
	@GetMapping("/")
	public String redirecToMain() {
		return "main";
	}

	@ModelAttribute("user")
	public LoginDto getDto() {
		return new LoginDto();
	}

	@GetMapping("/loginform")
	public String loginform() {
		return "login/loginform";
	}

	// 로그인
	@PostMapping("/login")
	public String login(@ModelAttribute("command") @Valid LoginDto dto, BindingResult error, Model m) {
		LoginDto resultDto = service.login(dto); // service.login(dto) -> 로그인 성공한 경우 LoginDto 객체를 반환하고, 실패한 경우 null을 반환함
		if (resultDto == null) {
			m.addAttribute("loginError","아이디나 비밀번호가 틀렸습니다.");
			return "login/loginform";
		} else {// 로그인 성공
			m.addAttribute("user", resultDto);
		}
		return "redirect:/main";
	}

	// 메인 페이지 이동
	@RequestMapping("/main") // "/main" 경로로 들어오는 요청을 이 메소드에서 처리할 수 있도록 지정해주는 것
	public String main(@ModelAttribute("user") LoginDto dto) {
		if (dto.getUserid() != null) {
			return "main";
		} else {
			return "login/loginform";
		}
	}

	@GetMapping("/joinform")
	public String joinform() {
		return "login/joinform";
	}

	// 회원가입 처리
	@PostMapping("/join")
	public String joinProc(@Valid LoginDto dto, @RequestParam("phone") String phone, BindingResult bindingResult, Model model) {

		if (bindingResult.hasErrors()) {
			model.addAttribute("userDto", dto);

			Map<String, String> validatorResult = service.validateHandling(bindingResult);
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			return "login/joinform";
		}
		dto.setPhone(phone);
		service.insertUser(dto);
		return "redirect:loginform";
	}

	// 아이디 중복체크
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(String id) {
		String checkid = service.idCheck(id);
		return checkid; // text
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}

	@GetMapping("/updateform")
	public String updateform(@ModelAttribute("user") LoginDto dto) {
		return "login/updateform";
	}

	// 회원정보 수정 처리
	@PutMapping("/update")
	public String update(@ModelAttribute("user") LoginDto dto, SessionStatus status) {
		service.updateUser(dto);
		status.setComplete();
		return "redirect:/main";
	}

	@GetMapping("/deleteform")
	public String deleteform(String result, Model m) {
		m.addAttribute("result", result);
		return "login/deleteform";
	}

	// 탈퇴 처리
	@DeleteMapping("/delete")
	public String delete(String formpw, @ModelAttribute("user") LoginDto dto, SessionStatus status) {
		int i = service.deleteUser(formpw, dto);
		if (i == 0) {
			return "redirect:/delete?result=false";
		} else {
			status.setComplete();
			return "redirect:/";
		}
	}
}
