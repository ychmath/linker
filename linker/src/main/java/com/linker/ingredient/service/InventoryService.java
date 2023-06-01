package com.linker.ingredient.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.ingredient.dao.InventoryDao;
import com.linker.ingredient.dto.InventoryDto;

@Service
public class InventoryService {
	@Autowired
	InventoryDao dao;
	
	// 인벤토리 목록 수
	public int inventoryCount() {
		return dao.inventoryCount();
	}
	
	// 인벤토리 출력
	public List<InventoryDto>getInvenList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.getInvenList(m);
	}
	
	// 이름별 검색 수
	public int invennameSearchCount(String ingredientname) {
		return dao.invennameSearchCount(ingredientname);
	}
	
	// 이름별 검색 목록
	public List<InventoryDto> getInventoryByName(int start, String ingredientname) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("ingredientname", ingredientname);
		m.put("start", start);
		m.put("count", 10);
		
		return dao.getInventoryByName(m);
	}
	
	// 입고일별 검색 수
	public int ReceiveSearchCount(Date startDay, Date endDay) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("startDay", startDay);
		m.put("endDay", endDay);
		
		return dao.ReceiveSearchCount(m);
	}
	
	// 입고일별 검색
	public List<InventoryDto> getInventoryByReceive(int start, Date startDay, Date endDay) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("startDay", startDay);
		m.put("endDay", endDay);
		m.put("count", 10);
		
		return dao.getInventoryByReceive(m);
	}


}
