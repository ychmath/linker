package com.linker.ingredient.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.linker.ingredient.dao.UseDetailDao;
import com.linker.ingredient.dto.UseDetailDto;

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

}
