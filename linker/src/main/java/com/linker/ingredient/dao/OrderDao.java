package com.linker.ingredient.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.ingredient.dto.OrderDto;

@Mapper
public interface OrderDao {

	// <!-- 식자재 입고 -->
	int addOrder (OrderDto dto);

	// 입고 내역 삭제
	int deleteOrder(int orderid);

	// 입고 내역 수
	int orderCount();

	// <!-- 식자재 입고 내역 출력 -->
	List<OrderDto> orderList(Map<String, Object> m);
	
	// 입고 내역 이름 검색
	List<OrderDto> orderSearchByName(Map<String, Object> m);
	
	// 입고 내역 이름 검색 개수
	int searchNameCount(String name);
	
	// 입고 내역 날짜 검색
	List<OrderDto> orderSearchByDate(Map<String, Object> m);
	
	// 식자재 입고 내역 이름별 검색 개수
	int searchOrderdateCount(Map<String, Object> m);
	
	// 식자재 목록 가져오기
	List<OrderDto> getIngredientList();

}
