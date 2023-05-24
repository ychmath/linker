package com.linker.ticket.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.ticket.dao.TicketorderDao;
import com.linker.ticket.dto.TicketorderDto;

@Service
public class TicketorderService {
	@Autowired
	TicketorderDao dao;

	public List<TicketorderDto> getAllTicketorder() {
		return dao.selectAll();
	}
	
	public List<TicketorderDto> getOrdersByDate(Date startDate, Date endDate) {
		Map<String , Date> map = new HashMap<>();
		map.put("startDate", startDate);
		
		
		return dao.selectByDate(map);
	}

	public int deleteOrderById(int orderId) {
		return 0;
	}

	public int addOrder(TicketorderDto dto) {
		return 0;
	
	}

	public List<TicketorderDto> selectByDate(Date startDate, Date endDate) {
		Map<String , Date> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return dao.selectByDate(map);
	}
}
