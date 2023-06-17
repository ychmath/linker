package com.linker.ingredient.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.ingredient.dto.UseDetailDto;

@Mapper
public interface UseDetailDao {
	// <!-- 식자재 사용 -->
	int useInventory(UseDetailDto dto);
	
	// 사용 내역 삭제
	int deleteUseage(int inventoryid);

	// 식자재 사용 내역
	int useCount();
	
	// <!-- 식자재 사용 내역 출력 -->
	List<UseDetailDto> useList(Map<String, Object> m);
	
	// 식자재 사용 내역 이름 검색 수
	int useNameCount(String ingredientname);
	
	// 식자재 사용 내역 이름 검색 리스트
	List<UseDetailDto> getUseByName(Map<String, Object> m);
	
	// 사용일 기준 조회 수
	int useDateCount(Map<String, Object> m);
	
	// 사용일 기준 조회 리스트
	List<UseDetailDto> getByUseDate(Map<String, Object> m);
	
	// 식자재 id로 인벤토리 가져오기
	List<UseDetailDto> getInvenList(int ingredientid);
	
	// 사용내역 정보 가져오기
	UseDetailDto getInvenInfo(int inventoryid);
	
	// 인벤토리의 식자재 종류 가져오기
	List<UseDetailDto> inventoryIngredient();

}