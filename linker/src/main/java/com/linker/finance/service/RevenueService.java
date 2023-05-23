package com.linker.finance.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.finance.dao.RevenueDao;
import com.linker.finance.dto.ProfitDto;
import com.linker.finance.dto.RevenueDto;

@Service
public class RevenueService {
	@Autowired
	RevenueDao dao;

	public List<RevenueDto> getAllIngredient() {
	    return dao.selectAll();
	}

	public List<RevenueDto> getOrdersByDate(String date) {
		return null;
	}

	public int deleteOrderById(int orderId) {
		return 0;
	}

	public int addOrder(RevenueDto dto) {
		return 0;
	
	}

	public List<RevenueDto> selectByDate(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		Map<String , Date> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return dao.selectByDate(map);
	}
}
