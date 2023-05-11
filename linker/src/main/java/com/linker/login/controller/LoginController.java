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
@SessionAttributes("user") //세션에 객체를 저장하기 위한 어노테이션
public class LoginController{
	
	@Autowired
	LoginService service;
	
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
		return "login/loginform";
	}
	 
	@PostMapping("/login") //@PostMapping: 본문에서 데이터를 추출
	public String login(@ModelAttribute("command") @Validated LoginDto dto, BindingResult error, Model m) {
	//@ModelAttribute("command"): "command"라는 이름으로 바인딩되는 폼 데이터를 객체에 자동 매핑해줌
	//@Validated: LoginDto 객체의 값이 유효한지 검증. 만약 유효하지 않은 값이 포함되어 있다면 에러메시지가 "BindingResult error" 객체에 저장됨
	//@Model: View로 데이터를 전달할 때 사용되는 객체
		LoginDto resultDto = service.login(dto); //service.login(dto) -> 로그인 성공한 경우 LoginDto 객체를 반환하고, 실패한 경우 null을 반환함
		if(resultDto == null) {
			error.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀림"); //'error' 객체에 로그인 실패 메시지를 추가
			return "login/loginform";
		}else {
			m.addAttribute("user", resultDto); //model 객체에 "user" 이름으로 LoginDto 객체를 저장 
		}
		return "redirect:/main";
		
	}
	
	@RequestMapping("/main") // "/main" 경로로 들어오는 요청을 이 메소드에서 처리할 수 있도록 지정해주는 것
	public String main(@ModelAttribute("user") LoginDto dto) {
		if(dto.getUserid() != null) {
			return "login/main";
		// "/main" 경로로 GET 요청이 왔을 때, 현재 로그인되어 있는 사용자의 정보를 보여주는 메인 페이지로 이동하는 기능을 수행
		}else {
			return "login/loginform";
		}
	}

	@GetMapping("/update")
	public String updateform(@ModelAttribute("user") LoginDto dto) {
		return "login/updateform";
	}
	
	@PutMapping("/update")
	//@PutMapping: 서버에 존재하는 리소스를 수정하기 위해 사용되는 메서드로, 요청 본문에 포함된 데이터를 해당 리소스로 업데이트하는 용도로 사용
	public String update(@ModelAttribute("user") LoginDto dto) {
		service.updateUser(dto); //service 객체의 updateUser() 메서드를 호출하여 사용자 정보를 업데이트함
		return "redirect:/main";
	}
	
	@GetMapping("/insert")
	public String joinform() {
		return "login/joinform";
	}
	
	@PostMapping("/insert")
	public String insert(LoginDto dto) {
		service.insertUser(dto);
		return "redirect:/loginform";
		
		}

	@GetMapping("idCheck")
	@ResponseBody 
	//@ResponseBody 를 사용하여, 클라이언트의 HTTP GET 요청에 대한 응답으로 문자열 데이터를 반환하는 방법을 보여주고 있음
	public String idCheck(String id) {
		String checkid = service.idCheck(id);
		return checkid; //text
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		/* SessionStatus: 세션 처리와 관련된 여러 메서드를 제공. 주로 로그아웃 처리나 세션 타임아웃 처리 등에 사용됨
		 * setComplete(): 현재 요청에 대한 세션을 완료(complete)처리함. 즉, 세션에 저장된 데이터를 삭제하고, 세션을 종료함
		 */
		status.setComplete();
		return "redirect:/";
	}
	
//--------------------------------------------------------------------------------------------------------------------------
	
	@GetMapping("/delete")
	public String deleteform(String result, Model m) {
		m.addAttribute("result", result);
		return "login/delete";
	}
	
	@DeleteMapping("/delete")
	public String delete(String formpw, @ModelAttribute("user") LoginDto dto, SessionStatus status) {
		int i = service.deleteUser(formpw, dto);
		if(i == 0) {
			return "redirect:/delete?result=false";
		}else {
			status.setComplete();
			return "redirect:/";
		}
	}
	
	
	
}
