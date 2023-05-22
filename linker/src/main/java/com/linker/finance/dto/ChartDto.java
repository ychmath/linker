package com.linker.finance.dto;

import lombok.Data;

@Data
public class ChartDto {
	private int totalPurchase;
	private int totalSale;

	private int targetYear;
	private int month;
}
