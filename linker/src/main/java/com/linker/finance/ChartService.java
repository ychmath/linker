package com.linker.finance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChartService {
	@Autowired
	ChartDao dao;
	
	// 연도 입력, 월별 티켓 구매 금액 가져오기
	public List<ChartDto> yearlySale(int targetYear) {
		return dao.yearlySale(targetYear);
	}

	// 연도 입력, 월별 재료 구매 금액 가져오기
	public List<ChartDto> yearlyPurchase(int targetYear) {
		return dao.yearlyPurchase(targetYear);
	}
}
