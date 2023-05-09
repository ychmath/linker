package com.linker.login.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class LoginDto {
	
	@NotNull(message="id is null.")
	@NotEmpty(message="id is empty.")
	private String id;
	@NotNull(message="password is null.")
	@NotEmpty(message="password is empty.")
	private String  password;
	private String name;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date birth; 
	private String address;
	
}