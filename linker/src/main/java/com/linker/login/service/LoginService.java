package com.linker.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.login.dao.LoginDao;
import com.linker.login.dto.LoginDto;

@Service
public class LoginService {
	@Autowired
	LoginDao dao;
	
	public String idCheck(String id) {
		return dao.idCheck(id);
	}
	public int insertMem(LoginDto dto) {
		return dao.insertMem(dto);
	}
	public LoginDto login(LoginDto dto) {
		return dao.login(dto);
	}
	public int updateMem(LoginDto dto) {
		return dao.updateMem(dto);
	}
	public int deleteMem(String formpw, LoginDto dto ) {
		String pw = dto.getPassword();
		if(pw.equals(formpw)) {
			return dao.deleteMem(dto.getId());
		}else {
			return 0;
		}
	}

}

