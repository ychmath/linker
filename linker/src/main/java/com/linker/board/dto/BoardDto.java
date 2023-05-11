package com.linker.board.dto;

import java.util.Date;

import com.linker.login.dto.LoginDto;

import lombok.Data;

@Data
public class BoardDto extends LoginDto{

	private int noticepostid;
	private String title;
	private String content;
	private Date creationdate;
	private String name;

}
