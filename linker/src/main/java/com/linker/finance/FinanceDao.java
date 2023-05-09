package com.linker.finance;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FinanceDao {
	// 연도 입력, 월별 티켓 구매 금액 가져오기
	List<FinanceDto> yearlySale(int targetYear);

	// 연도 입력, 월별 재료 구매 금액 가져오기
	List<FinanceDto> yearlyPurchase(int targetYear);
	
}
