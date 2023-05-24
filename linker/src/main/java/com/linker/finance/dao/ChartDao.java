package com.linker.finance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.linker.finance.dto.ChartDto;

@Mapper
public interface ChartDao {
	// 연도 입력, 월별 매출 금액 가져오기
	List<ChartDto> yearlySale(int targetYear);

	// 연도 입력, 월별 매입 금액 가져오기
	List<ChartDto> yearlyPurchase(int targetYear);
	
}
