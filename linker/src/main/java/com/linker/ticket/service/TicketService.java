package com.linker.ticket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.ticket.dao.TicketDao;
import com.linker.ticket.dto.TicketOrderDto;

@Service
public class TicketService {

	@Autowired
	TicketDao dao;
	
	public int buyTicket(TicketOrderDto dto) {
		return dao.buyTicket(dto);
	}

}
