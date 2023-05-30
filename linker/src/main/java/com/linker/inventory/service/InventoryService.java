package com.linker.inventory.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.inventory.dao.InventoryDao;
import com.linker.inventory.dto.InventoryDto;

@Service
public class InventoryService {
	@Autowired
	InventoryDao dao;
	
	// <!-- 식자재 입고 -->
	public int addInventory(InventoryDto dto) {
		return dao.addInventory(dto);
	}

	// <!-- 식자재 사용 -->
	public int useInventory(InventoryDto dto) {
		return dao.useInventory(dto);
	}

	// <!-- 식자재 입고내역 수정 -->
	public int changeOrder(InventoryDto dto) {
		return dao.changeOrder(dto);
	}

	// <!-- 식자재 사용내역 수정 -->
	public int changeUseage (InventoryDto dto) {
		return dao.changeUseage(dto);
	}
	
	// 입고 내역 삭제
	public int deleteOrder(int orderid) {
		return dao.deleteOrder(orderid);
	}
	
	// 사용 내역 삭제
	public int deleteUseage(int inventoryid) {
		return dao.deleteUseage(inventoryid);
	}
	
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

	// 입고 내역 수
	public int orderCount() {
		return dao.orderCount();
	}
	
	// <!-- 식자재 입고 내역 출력 -->
	public List<InventoryDto> orderList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.orderList(m);
	}

	// 식자재 사용 내역
	public int useCount() {
		return dao.useCount();
	}
	
	// <!-- 식자재 사용 내역 출력 -->
	public List<InventoryDto> useList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.useList(m);
	}

}
