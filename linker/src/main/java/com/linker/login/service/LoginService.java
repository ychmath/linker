package com.linker.login.service;


import java.util.List;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.linker.login.dao.LoginDao;
import com.linker.login.dto.LoginDto;

@Service
public class LoginService {

	@Autowired
	LoginDao dao;

	public String idCheck(String userid) {
		return dao.idCheck(userid);
	}

	public int insertUser(LoginDto dto) {
		return dao.insertUser(dto);
	}

	public int updateUser(LoginDto dto) {
		return dao.updateUser(dto);
	}

	public int deleteUser(String formpw, LoginDto dto) {
		String pw = dto.getPassword();
		if (pw.equals(formpw)) {
			return dao.deleteUser(dto.getUserid()); // dao.deleteUser(dto.getId()를 호출하여 DB에서 해당 회원 정보를 삭제하고, 삭제된 레코드 수를
													// 반환함
		} else {
			return 0; // 일치하지 않으면 0을 반환 => 삭제 작업이 실패했음을 의미함
		}
	}

	public LoginDto login(LoginDto dto) { // LoginDto는 로그인 시 사용자의 정보를 담고 있는 클래스. 데이터 전송을 위한 객체
		return dao.login(dto);
	}

	public List<LoginDto> userInfo() {
		return dao.userInfo();
	}

	public Map<String, String> validateHandling(BindingResult bindingResult) {
		Map<String, String> errorMap = new HashMap<>();

		// BindingResult 객체에서 발생한 에러들을 꺼내어, 필드와 관련된 에러 메시지를 저장합니다.
		for (FieldError error : bindingResult.getFieldErrors()) {
			errorMap.put(error.getField(), error.getDefaultMessage());
		}

		return errorMap;
	}

	public boolean checkPassword(String userid, String currentPassword) {
		LoginDto user = dao.findByUserId(userid);
		return user != null && user.getPassword().equals(currentPassword);
	}

	public String findId(LoginDto dto) {
		String userid = dao.findId(dto);
		return userid;
	}
}
