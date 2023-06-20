package com.linker.ticket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.linker.ticket.dto.TicketUpdateDto;

@Mapper
public interface TicketUpdateDao {
	// 식권 목록
	List<TicketUpdateDto> getTicket();

	int addTicket(TicketUpdateDto dto);
	
	int updateTicket(TicketUpdateDto dto);
	
	int deleteTicket(int tickettypeid);
	
	TicketUpdateDto getTicketByID(int tickettypeid);
}
