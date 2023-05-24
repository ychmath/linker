package com.linker.finance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.finance.dao.ChartDao;
import com.linker.finance.dto.ChartDto;

@Service
public class ChartService {
	@Autowired
	ChartDao dao;
	
	// 연도 입력, 월별 매출 금액 가져오기
	public List<ChartDto> yearlySale(int targetYear) {
		return dao.yearlySale(targetYear);
	}

	// 연도 입력, 월별 매입 금액 가져오기
	public List<ChartDto> yearlyPurchase(int targetYear) {
		return dao.yearlyPurchase(targetYear);
	}
}
