package com.linker.ingredient.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.ingredient.dto.InventoryDto;

@Mapper
public interface InventoryDao {
	
	// 인벤토리 목록 수
	int inventoryCount();
	
	// 인벤토리 출력
	List<InventoryDto> getInvenList(Map<String, Object> m);
	
	// 이름별 검색 수
	int invennameSearchCount(String ingredientname);
	
	// 이름별 검색 목록
	List<InventoryDto> getInventoryByName(Map<String, Object> m);
	
	// 입고일별 검색 수
	int ReceiveSearchCount(Map<String, Object> m);
	
	// 입고일별 검색
	List<InventoryDto> getInventoryByReceive(Map<String, Object> m);

}
