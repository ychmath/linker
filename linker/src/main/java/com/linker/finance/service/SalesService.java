package com.linker.finance.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.finance.dao.SalesDao;
import com.linker.finance.dto.SalesDto;

@Service
public class SalesService {
    @Autowired
    SalesDao dao;

	public List<SalesDto> getAllOrders() {
	    return dao.selectAll();
	}

	public List<SalesDto> getOrdersByDate(String date) {
		return null;
	}

	public int deleteOrderById(int orderId) {
		return 0;
	}

	public int addOrder(SalesDto dto) {
		return 0;
	}

	public List<SalesDto> selectByDate(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		Map<String , Date> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return dao.selectByDate(map);
	}
	
}