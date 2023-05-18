package com.linker.ingredient;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ListService {
	@Autowired
	ListDao dao;
	
	// 식자재 추가
	public int addIngredient(ListDto dto) {
		return dao.updateIngredient(dto);
	}

	// 식자재 수정
	public int updateIngredient(ListDto dto) {
		return updateIngredient(dto);
	}

	// 식자재 삭제
	public int deleteIngredient(int ingredientid) {
		return dao.deleteIngredient(ingredientid);
	}

	// 식자재 목록 조회
	public List<ListDto> getIngredient(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.getIngredient(m);
	}

	// 식자재 목록 개수 가져오기
	public int ingredientCount() {
		return dao.ingredientCount();
	}

	// 식자재 이름으로 조회
	public List<ListDto> getIngredientByName(int start, String name) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("name", name);
		m.put("start", start);
		m.put("count", 10);

		return dao.getIngredientByName(m);
	}

	// 이름으로 조회된 개수
	public int nameSearchCount(String name) {
		return dao.nameSearchCount(name);
	}

	// 식자재 유통기한 조회
	public List<ListDto> getIngredientByExp(int start, Date startDay, Date endDay) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("startDay", startDay);
		m.put("endDay", endDay);
		m.put("start", start);
		m.put("count", 10);
		
		return dao.getIngredientByExp(m);
	}
	
	// 유통기한으로 조회된 개수
	public int expSearchCount(Date startDay, Date endDay) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("startDay", startDay);
		m.put("endDay", endDay);
		
		return dao.expSearchCount(m);

	}

}
