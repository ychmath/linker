package com.linker.payment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.payment.dao.PhoneDao;
import com.linker.payment.dto.PhoneDto;

@Service
public class PhoneService {

	@Autowired
	PhoneDao dao;

	// 식권 사용 내역 검증, 업데이트
	public boolean updateTicketUseByPhone(int tickettypename, Integer quantity, String phone) {
			Map<String , Object> map = new HashMap<>();
			map.put("tickettypename", tickettypename);
			map.put("quantity", quantity);
			map.put("phone", phone);
			
		   int updatedRows = dao.updateTicketQuantityByPhone(map);
		     if (updatedRows <= 0) {
		         return false;
		     }
		     return true;
	}

	//식권 수량 감소
	public int decrementTicketQuantityByPhone(String tickettypename, Integer quantity, String phone) {
		Map<String , Object> map = new HashMap<>();
		map.put("tickettypename", tickettypename);
		map.put("quantity", quantity);
		map.put("phone", phone);
		return dao.updateTicketQuantityByPhone(map);
	
	}
	public List<Integer> ticketidList() {
		// TODO Auto-generated method stub
		return dao.tickettypeidList();
	}

	public List<PhoneDto> gettypename() {
		return dao.gettypename();
	}
}
