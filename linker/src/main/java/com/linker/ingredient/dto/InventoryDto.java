package com.linker.ingredient.dto;

import java.util.Date;

import lombok.Data;

@Data
public class InventoryDto {
	// 식자재
	private int ingredientid;
	private String ingredientname;
	private Date exp;

	// 인벤토리
	private int inventoryid;
	private int quantity;
	private Date receivedate;

}
