package com.linker.ticket.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.linker.ticket.dto.TicketUseDto;

@Mapper
public interface TicketUseDao {
	public List<TicketUseDto> selectAll();

	List<TicketUseDto> selectByDate(Map<String, Date> map);
}