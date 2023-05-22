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

	public int buyTicket(TicketOrderDto dto) {
		return dao.buyTicket(dto);
	}
	
	public List<TicketOrderDto> getAllTicketorder() {
		return dao.selectAll();
	}
	
	public List<TicketOrderDto> getOrdersByDate(String date) {
		return null;
	}

	public int deleteOrderById(int orderId) {
		return 0;
	}

	public int addOrder(TicketOrderDto dto) {
		return 0;
	
	}

	public List<TicketOrderDto> selectByDate(Date startDate, Date endDate) {
		Map<String , Date> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return dao.selectByDate(map);
	}
}