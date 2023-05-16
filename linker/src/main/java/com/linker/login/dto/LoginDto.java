package com.linker.login.dto;

import java.util.Date;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class LoginDto {
	
	@NotNull(message="name is null.")
	@NotEmpty(message="name is empty.")
	private String name;
	
	@NotNull(message="id is null.")
	@NotEmpty(message="id is empty.")
	private String userid;
	
	@NotNull(message="password is null.")
	@NotEmpty(message="password is empty.")
	private String password;
	
	@NotNull(message="email is null.")
	@NotEmpty(message="email is empty.")
	private String email;
	
	private String phone;
	private String role;
	private Date signupdate;
	
}
