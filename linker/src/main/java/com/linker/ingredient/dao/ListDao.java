package com.linker.ingredient.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.ingredient.dto.ListDto;

@Mapper
public interface ListDao {
	// 식자재 추가
	int addIngredient(ListDto dto);

	// 식자재 수정
	int updateIngredient(ListDto dto);

	// 식자재 삭제
	int deleteIngredient(int ingredientid);

	// 식자재 목록 조회
	List<ListDto> getIngredient(Map<String, Object> m);
	
	// 식자재 목록 개수 가져오기
	int ingredientCount();
	
	// 식자재 ID 가져오기
	ListDto getIngredientByID(int ingredientid);

	// 식자재 이름으로 조회
	List<ListDto> getIngredientByName(Map<String, Object> m);
	
	// 이름 조회 개수
	int nameSearchCount(String name);

	// 식자재 유통기한 조회 -->
	List<ListDto> getIngredientByExp(Map<String, Object> m);
	
	// 기간 조회 개수
	int expSearchCount(Map<String, Object> m);

}
