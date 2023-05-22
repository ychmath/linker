package com.linker.finance.dto;

import java.util.Date;

import lombok.Data;

@Data
public class RevenueDto {
	private int orderid;
	private String ingredientname;
	private int price;
	private Date orderdate;

}