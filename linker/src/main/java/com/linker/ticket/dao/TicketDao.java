package com.linker.ticket.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.linker.ticket.dto.TicketOrderDto;

@Mapper
public interface TicketDao {

	@Insert("insert into ticketorder(userid, tickettype, quantity, orderdate) values(#{userid}, #{tickettype}, #{quantity}, #{orderdate})")
	public int buyTicket(TicketOrderDto dto);
	

	
}
