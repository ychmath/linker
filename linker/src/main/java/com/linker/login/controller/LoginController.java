package com.linker.login.controller;

import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.linker.login.dao.LoginDao;
import com.linker.login.dto.LoginDto;
import com.linker.login.service.LoginService;


import jakarta.validation.Valid;



@Controller
@SessionAttributes("user") //세션에 객체를 저장하기 위한 어노테이션
public class LoginController{
	
	@Autowired
	LoginService service;
	
	 @Autowired
	 private LoginDao dao;
	 
	 

	
	@ModelAttribute("user") 
	//컨트롤러의 메서드에 적용하여 해당 메서드가 반환하는 객체를 모델에 자동으로 추가함
	//이를 통해 뷰에서 해당 객체에 접근하여 사용할 수 있음
	public LoginDto getDto() {
	//getDto() 메서드가 LoginDto 객체를 생성하여 "user"라는 이름으로 모델에 추가함
	//따라서 뷰에서는 "user"라는 이름으로 LoginDto 객체에 접근하여 값을 가져올 수 있음
		return new LoginDto();
	}
	
	@GetMapping("/loginform")
	public String loginform() {
		return "Login/loginform";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute("command") @Validated LoginDto dto, BindingResult error, Model m) {
	//@ModelAttribute("command"): "command"라는 이름으로 바인딩되는 폼 데이터를 객체에 자동 매핑해줌
	//@Validated: LoginDto 객체의 값이 유효한지 검증. 만약 유효하지 않은 값이 포함되어 있다면 에러메시지가 "BindingResult error" 객체에 저장됨
	//@Model: View로 데이터를 전달할 때 사용되는 객체
		LoginDto resultDto = service.login(dto); //service.login(dto) -> 로그인 성공한 경우 LoginDto 객체를 반환하고, 실패한 경우 null을 반환함
		if(resultDto == null) { //'error' 객체에 로그인 실패 메시지를 추가
			return "Login/loginform";
		}else {
			m.addAttribute("user", resultDto); //model 객체에 "user" 이름으로 LoginDto 객체를 저장 
		}
		return "redirect:/main";
		
	}
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
    @ResponseBody
    public String emailCheck(String email) {
        String result = dao.emailCheck(email);
        return result; // 이미 존재하는 이메일이 있으면 해당 이메일 반환, 없으면 null 반환
    }

	
	@RequestMapping("/main") // "/main" 경로로 들어오는 요청을 이 메소드에서 처리할 수 있도록 지정해주는 것
	public String main(@ModelAttribute("user") LoginDto dto) {
		if(dto.getUserid() != null) {
			return "Login/main";
		// "/main" 경로로 GET 요청이 왔을 때, 현재 로그인되어 있는 사용자의 정보를 보여주는 메인 페이지로 이동하는 기능을 수행
		}else {
			return "Login/loginform";
		}
	}

//--------------------------------------------------------------------------------------------------------------------------
	
	@GetMapping("/joinform")
	public String joinform() {
		return "Login/joinform";
	}

	@GetMapping("idCheck")
	@ResponseBody
	public String idCheck(String id) {
		String checkid = service.idCheck(id);
		return checkid; //text
	}
	
	@PostMapping("/insert")
	public String insert(LoginDto dto) {
		service.insertUser(dto);
		return "redirect:loginform";
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
		service.updateUser(dto);
		return "redirect:/main";
	}
	
	@GetMapping("/delete")
	public String deleteform(String result, Model m) {
		m.addAttribute("result", result);
		return "Login/deleteform";
	}
	
	@PostMapping("/delete")
    public String delete(String formpw, @ModelAttribute("user") LoginDto dto, SessionStatus status) {
        int i = service.deleteUser(formpw, dto);
        if(i == 0) {
            return "redirect:/delete?result=false";
        }else {
            status.setComplete();
            return "redirect:/";
        }
    }
	// 기존 'insert' 메서드에 대해 코드를 병합
	@PostMapping("/auth/joinProc")
	public String joinProc(@Valid LoginDto dto, BindingResult bindingResult, Model model) {

	    if (bindingResult.hasErrors()) {
	        model.addAttribute("userDto", dto);

	        // 유효성 통과 못한 필드와 메시지를 핸들링. validateHandling 메서드가 필요합니다.
	        // userService를 LoginService로 교체하면 기존 사용중인 LoginService를 사용할 수 있습니다.
	        Map<String, String> validatorResult = service.validateHandling(bindingResult);
	        for (String key : validatorResult.keySet()) {
	            model.addAttribute(key, validatorResult.get(key));
	        }

	        return "Login/joinform";
	    }
	    service.insertUser(dto);
	    return "redirect:/auth/login";
	}

	
}
