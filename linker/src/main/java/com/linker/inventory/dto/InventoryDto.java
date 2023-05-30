package com.linker.inventory.dto;

import java.util.Date;

import lombok.Data;

@Data
public class InventoryDto {
	// 주문
	private int orderid;
	private int ingredientid;
	private Date orderdate;
	private int orderquantity;
	private String supplier;
	private int orderprice;

	private String ingredientname;

	// 인벤토리
	private int inventoryid;
	private int quantity;
	private Date receivedate;

	// 식자재 사용내역
	private int ingredientusage;
	private Date usedate;

}
