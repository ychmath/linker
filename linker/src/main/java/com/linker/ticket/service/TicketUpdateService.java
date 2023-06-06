package com.linker.ticket.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.ticket.dao.TicketupdateDao;
import com.linker.ticket.dto.TicketupdateDto;

@Service
public class TicketUpdateService {

	@Autowired
	TicketupdateDao dao;
	
	public List<TicketupdateDto>getTicket(){
		return dao.getTicket();
	}
	
	//식권 추가
	public int addTicket(TicketupdateDto dto) {
		return dao.addTicket(dto);
	}

	//식권 수정
	public int updateTickettype(TicketupdateDto dto) {
		return dao.updateTicket(dto);
	}

	// 식권 가져오기
	public TicketupdateDto getTicketById(int tickettypeid) {
		return dao.getTicketByID(tickettypeid);
	}

	// 식권 삭제
	/*
	 * public int deleteTicket(int tickettypeid) { return
	 * dao.deleteTicket(tickettypeid); }
	 */

}