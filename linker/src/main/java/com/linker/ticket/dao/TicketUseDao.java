package com.linker.ticket.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.ticket.dto.TicketUseDto;

@Mapper
public interface TicketUseDao {
	
	List<TicketUseDto> selectAll(Map<String, Object> m);
	
	public List<TicketUseDto> selectByDate(Map<String, Object> m);
	
	public int count(String userid);
	
	int selectByDateCount(Map<String, Object> m);
}