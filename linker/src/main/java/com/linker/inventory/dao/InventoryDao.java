package com.linker.inventory.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.inventory.dto.InventoryDto;

@Mapper
public interface InventoryDao {
	
	// <!-- 식자재 입고 -->
	int addInventory (InventoryDto dto);

	// <!-- 식자재 사용 -->
	int useInventory (InventoryDto dto);

	// <!-- 식자재 입고내역 수정 -->
	int changeOrder (InventoryDto dto);

	// <!-- 식자재 사용내역 수정 -->
	int changeUseage (InventoryDto dto);
	
	// 입고 내역 삭제
	int deleteOrder(int orderid);

	// 사용 내역 삭제
	int deleteUseage(int inventoryid);
	
	// 인벤토리 목록 수
	int inventoryCount();
	
	// 인벤토리 출력
	List<InventoryDto> getInvenList(Map<String, Object> m);

	// 입고 내역 수
	int orderCount();
	
	// <!-- 식자재 입고 내역 출력 -->
	List<InventoryDto> orderList(Map<String, Object> m);

	// 식자재 사용 내역
	int useCount();
	
	// <!-- 식자재 사용 내역 출력 -->
	List<InventoryDto> useList(Map<String, Object> m);

}
