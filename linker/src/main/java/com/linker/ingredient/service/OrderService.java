package com.linker.ingredient.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.ingredient.dao.OrderDao;
import com.linker.ingredient.dto.OrderDto;

@Service
public class OrderService {
	
	@Autowired
	OrderDao dao;
	
	// <!-- 식자재 입고 -->
	public int addOrder(OrderDto dto) {
		return dao.addOrder(dto);
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

	// 식자재 입고 내역 이름별 검색
	public List<OrderDto> orderSearchByName(int start, String name) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("name", name);
		m.put("start", start);
		m.put("count", 10);
		return dao.orderSearchByName(m);
	}

	// 이름별 검색 개수
	public int searchNameCount(String name) {
		return dao.searchNameCount(name);
	}

	// 입고 내역 날짜별 검색
	public List<OrderDto> orderSearchByDate(int start, Date startDay, Date endDay) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("startDay", startDay);
		m.put("endDay", endDay);
		m.put("start", start);
		m.put("count", 10);
		
		return dao.orderSearchByDate(m);
	}

	// 조회된 개수
	public int searchOrderdateCount(Date startDay, Date endDay) {
		Map<String, Object> m = new HashMap<String, Object>();
		
		m.put("startDay", startDay);
		m.put("endDay", endDay);
		
		return dao.searchOrderdateCount(m);
	}
	
	// 식자재 목록 출력
	public List<OrderDto> getIngredientList() {
		return dao.getIngredientList();
	}

}
