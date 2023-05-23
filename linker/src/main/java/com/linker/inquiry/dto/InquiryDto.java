package com.linker.inquiry.dto;

import java.util.Date;

import com.linker.login.dto.LoginDto;

import lombok.Data;

@Data
public class InquiryDto{

	private int inquirypostid;
	private String title;
	private String content;
	private Date creationdate;
	private int readcount;
	private int ref;
	private int restep;
	private int relevel;
	private String userid;
	
	
}
