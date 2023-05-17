package com.linker.admin;

import java.util.Date;

import lombok.Data;

@Data
public class AdminDto {
	// 회원 정보 관련 dto
	private String userid;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String role;
	private Date signupdate;

	// 문의사항 관련 dto
	private int inquirypostid;
	// private String userid;
	private String title;
	private String content;
	private Date creationdate;
	private int ref;
	private int refstep;
	private int relevel;
	
	// 공지사항 관련 dto
	private int noticepostid;
	// private String userid;
	// private String title;
	// private Date creationdate;
}
