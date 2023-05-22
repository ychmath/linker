package com.linker.ticket.dao;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.linker.ticket.dto.TicketorderDto;

@Mapper
public interface TicketorderDao {
	public List<TicketorderDto> selectAll();

	public List<TicketorderDto> selectByDate(Map<String,Date> map);
	
	public int deleteById(int orderId);
}

