package com.linker.ticket.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.ticket.dao.TicketUpdateDao;
import com.linker.ticket.dto.TicketUpdateDto;

@Service
public class TicketUpdateService {

	@Autowired
	TicketUpdateDao dao;
	
	public List<TicketUpdateDto>getTicket(){
		return dao.getTicket();
	}
	
	//식권 추가
	public int addTicket(TicketUpdateDto dto) {
		return dao.addTicket(dto);
	}

	//식권 수정
	public int updateTickettype(TicketUpdateDto dto) {
		return dao.updateTicket(dto);
	}

	// 식권 가져오기
	public TicketUpdateDto getTicketById(int tickettypeid) {
		return dao.getTicketByID(tickettypeid);
	}

	// 식권 삭제
	/*
	 * public int deleteTicket(int tickettypeid) { return
	 * dao.deleteTicket(tickettypeid); }
	 */

}