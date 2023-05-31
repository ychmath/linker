package com.linker.ingredient.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.linker.ingredient.dao.OrderDao;
import com.linker.ingredient.dto.OrderDto;

public class OrderService {
	
	@Autowired
	OrderDao dao;
	
	// <!-- 식자재 입고 -->
	public int addOrder(OrderDto dto) {
		return dao.addOrder(dto);
	}

	// <!-- 식자재 입고내역 수정 -->
	public int changeOrder(OrderDto dto) {
		return dao.changeOrder(dto);
	}

	// 입고 내역 삭제
	public int deleteOrder(int orderid) {
		return dao.deleteOrder(orderid);
	}

	// 입고 내역 수
	public int orderCount() {
		return dao.orderCount();
	}
	
	// <!-- 식자재 입고 내역 출력 -->
	public List<OrderDto> orderList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.orderList(m);
	}

}
