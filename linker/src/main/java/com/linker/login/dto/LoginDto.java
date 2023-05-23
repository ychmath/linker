package com.linker.login.dto;

import java.util.Date;

import lombok.Data;

@Data
public class LoginDto {
	
	private String name;
	private String userid;
	private String password;
	private String email;
	private String phone;
	private String role;
	private Date signupdate;

	
	

}
