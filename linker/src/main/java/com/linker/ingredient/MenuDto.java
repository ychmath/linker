package com.linker.ingredient;

import java.util.Date;

import lombok.Data;

@Data
public class MenuDto {

	private int menuID;
	private String userID;
	private String title;
	private String content;
	private Date creationDate;
	
}
