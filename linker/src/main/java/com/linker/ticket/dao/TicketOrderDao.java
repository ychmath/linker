package com.linker.ticket.dao;

import java.util.List;
import java.util.Map;

//import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
//import org.apache.ibatis.annotations.Select;

import com.linker.ticket.dto.TicketOrderDto;

@Mapper
public interface TicketOrderDao {

	public int buyTicket(TicketOrderDto dto);
	
	List<TicketOrderDto> selectAll(Map<String, Object> m);
	
	public List<TicketOrderDto> selectByDate(Map<String, Object> m);
	
	public int count(String userid);
	
	int selectByDateCount(Map<String, Object> m);
	
}
