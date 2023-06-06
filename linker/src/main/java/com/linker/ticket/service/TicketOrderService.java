package com.linker.ticket.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.ticket.dao.TicketOrderDao;
import com.linker.ticket.dto.TicketOrderDto;

@Service
public class TicketOrderService {
	@Autowired
	TicketOrderDao dao;

	// 전체 티켓 구매 내역 조히
	public List<TicketOrderDto> getAllTicketOrder() {
		return dao.selectAll();
	}

	// 특정 날짜의 구매한 식권 조회
	public List<TicketOrderDto> getOrderByDate(Date startDate, Date endDate) {
		Map<String, Date> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		return dao.selectByDate(map);
	}

	// 식권 구매 추가 메서드
	public int addUse(TicketOrderDto dto) {
		return 0;
	}

	// 식권 타입별 식권 주문 삭제
	public int deleteOrderById(int tickettypename) {
		return 0;
	}

	//필터링된 식권 구매 내역 조회(특정 기간 내)
	public List<TicketOrderDto> selectByDate(Date startDate, Date endDate) {
		Map<String, Date> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		return dao.selectByDate(map);
	}
}
