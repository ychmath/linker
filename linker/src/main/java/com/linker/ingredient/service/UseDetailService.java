package com.linker.ingredient.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.ingredient.dao.UseDetailDao;
import com.linker.ingredient.dto.UseDetailDto;

@Service
public class UseDetailService {
	@Autowired
	UseDetailDao dao;

	// <!-- 식자재 사용 -->
	public int useInventory(UseDetailDto dto) {
		return dao.useInventory(dto);
	}

	// <!-- 식자재 사용내역 수정 -->
	public int changeUseage (UseDetailDto dto) {
		return dao.changeUseage(dto);
	}
	
	// 사용 내역 삭제
	public int deleteUseage(int inventoryid) {
		return dao.deleteUseage(inventoryid);
	}

	// 식자재 사용 내역
	public int useCount() {
		return dao.useCount();
	}

	// <!-- 식자재 사용 내역 출력 -->
	public List<UseDetailDto> useList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.useList(m);
	}
	
	// 식자재 사용 내역 이름 검색 수
	public int useNameCount(String ingredientname) {
		return dao.useNameCount(ingredientname);
	}
	
	// 식자재 사용 내역 이름 검색 리스트
	public List<UseDetailDto> getUseByName(int start, String ingredientname) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("name", ingredientname);
		m.put("count", 10);
		return dao.getUseByName(m);
	}
	
	// 사용내역 사용일 기준 검색 수
	public int useDateCount(Date startDay, Date endDay) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("startDay", startDay);
		m.put("endDay", endDay);
		return dao.useDateCount(m);
	}
	
	// 사용일 기준 조회 리스트
	public List<UseDetailDto> getByUseDate(int start, Date startDay, Date endDay) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("startDay", startDay);
		m.put("endDay", endDay);
		m.put("count", 10);
		return dao.getByUseDate(m);
	}

}
