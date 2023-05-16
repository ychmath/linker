package com.linker.comm.dto;

import com.linker.login.dto.LoginDto;

import lombok.Data;

@Data
public class CommDto extends LoginDto{

	private int ref;
	private int restep;
	private int relevel;
	
}
