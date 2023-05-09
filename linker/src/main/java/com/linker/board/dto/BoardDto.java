package com.linker.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDto {

	private int NoticePostID;
	private String User_UserID;
	private String title;
	private String content;
	private Date date;
	private String name;

}
