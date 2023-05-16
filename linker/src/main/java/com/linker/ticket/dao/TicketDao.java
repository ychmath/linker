package com.linker.ticket.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.linker.ticket.dto.TicketOrderDto;

@Mapper
public interface TicketDao {

	@Insert("insert into ticketorder(userid, tickettype, quantity, orderdate) values(#{userid}, #{tickettype}, #{quantity}, #{orderdate})")
	public int buyTicket(TicketOrderDto dto);
	
	@Select("select userid, price * quantity \n"
			+ "from ticketorder, tickettype \n"
			+ "where ticketorder.tickettypeid = tickettype.tickettypeid")
	public int total();
	
	
}
