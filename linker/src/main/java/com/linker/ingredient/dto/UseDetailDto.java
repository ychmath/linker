package com.linker.ingredient.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UseDetailDto {

	// 식자재
	private int ingredientid;
	private String ingredientname;

	// 인벤토리
	private int inventoryid;
	private int quantity;
	private Date receivedate;

	// 식자재 사용내역
	private int usedetailid;
	private int ingredientusage;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date usedate;

}
