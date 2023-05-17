package com.linker.ticket.dao;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.linker.ticket.dto.TicketorderDto;

@Mapper
public interface TicketorderDao {
	@Select("SELECT ticketorder.tickettypeid, quantity, orderdate FROM ticketorder INNER JOIN tickettype ON ticketorder.tickettypeid = tickettype.tickettypeid;")
	public List<TicketorderDto> selectAll();

	@Select("SELECT ticketorder.tickettypeid, quantity, orderdate FROM ticketorder INNER JOIN tickettype ON ticketorder.tickettypeid = tickettype.tickettypeid where orderdate >= #{startDate} and orderdate <= #{endDate} order by orderdate DESC;")
	public List<TicketorderDto> selectByDate(Map<String,Date> map);
}

