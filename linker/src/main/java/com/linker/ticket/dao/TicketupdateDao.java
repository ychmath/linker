package com.linker.ticket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.linker.ticket.dto.TicketupdateDto;

@Mapper
public interface TicketupdateDao {
	/* public int updateTicket(String tickettypename, int price); */
	// 식권 목록
	List<TicketupdateDto> getTicket();

	int addTicket(TicketupdateDto dto);
	
	int updateTicket(TicketupdateDto dto);
	
	int deleteTicket(int tickettypeid);
	
	TicketupdateDto getTicketByID(int tickettypeid);
}
