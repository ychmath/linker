package com.linker.ticket.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.ticket.dao.TicketuseDao;
import com.linker.ticket.dto.TicketuseDto;
@Service
public class TicketuseService {
	
	@Autowired
	TicketuseDao dao;

	public List<TicketuseDto> getAllTicketuse() {
		return dao.selectAll();
	}

	public List<TicketuseDto> getUseByDate(Date startDate, Date endDate) {
		Map<String , Date> map = new HashMap<>();
		map.put("startDate", startDate);
		
		return dao.selectByDate(map);
	}

	public static int addUse(TicketuseDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	public static int deleteOrderById(int tickettypename) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<TicketuseDto> selectByDate(Date startDate, Date endDate) {
		Map<String , Date> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);		
		
		return dao.selectByDate(map);
	}

	public static List<TicketuseDto> getUseByDate(String date) {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
