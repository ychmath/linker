package com.linker.finance;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChartDao {
	// 연도 입력, 월별 티켓 구매 금액 가져오기
	List<ChartDto> yearlySale(int targetYear);

	// 연도 입력, 월별 재료 구매 금액 가져오기
	List<ChartDto> yearlyPurchase(int targetYear);
	
}
