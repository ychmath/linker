package com.linker.ingredient.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ListDto {
	
	private int ingredientid;
	private String ingredientname;
	private String unit;
	private Date exp;

}
