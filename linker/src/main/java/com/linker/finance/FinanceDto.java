package com.linker.finance;

import lombok.Data;

@Data
public class FinanceDto {
	private int totalPurchase;
	private int totalSale;

	private int targetYear;
	private int month;
}
