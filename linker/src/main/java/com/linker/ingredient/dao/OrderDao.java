package com.linker.ingredient.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.ingredient.dto.OrderDto;

@Mapper
public interface OrderDao {

	// <!-- 식자재 입고 -->
	int addOrder (OrderDto dto);

	// <!-- 식자재 입고내역 수정 -->
	int changeOrder (OrderDto dto);

	// 입고 내역 삭제
	int deleteOrder(int orderid);

	// 입고 내역 수
	int orderCount();

	// <!-- 식자재 입고 내역 출력 -->
	List<OrderDto> orderList(Map<String, Object> m);

}
