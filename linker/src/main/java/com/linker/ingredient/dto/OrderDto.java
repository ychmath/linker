package com.linker.ingredient.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderDto {
	// 주문정보
	private int orderid;
	private int orderquantity;
	private String supplier;
	private int orderprice;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderdate;

	// 식자재
	private int ingredientid;
	private String ingredientname;

}