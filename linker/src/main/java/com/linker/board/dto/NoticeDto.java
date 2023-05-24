package com.linker.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDto{

	private int noticepostid;
	private String userid;
	private String title;
	private String content;
	private Date creationdate;
	private String name;
}
