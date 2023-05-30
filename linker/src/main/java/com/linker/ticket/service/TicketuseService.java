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
	
	//전체 티켓 사용 내역 조히
	public List<TicketuseDto> getAllTicketuse() {
		return dao.selectAll();
	}
	
	// 특정 날짜의 사용된 식권 조회
	public List<TicketuseDto> getUsedByDate(Date startDate, Date endDate) {
		Map<String, Date> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		return dao.selectByDate(map);
	}
	
	//식권 사용 추가 메서드
	public int addUse(TicketuseDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	//식권 타입별 식권 주문 삭제
	public int deleteOrderById(int tickettypename) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<TicketuseDto> selectByDate(Date startDate, Date endDate) {
		Map<String, Date> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		return dao.selectByDate(map);
	}


}
