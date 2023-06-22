package com.linker.finance.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.finance.dao.ExpenditureDao;
import com.linker.finance.dto.ExpenditureDto;

@Service
public class ExpenditureService {
	@Autowired
	ExpenditureDao dao;

	public List<ExpenditureDto> getAllIngredient() {
	    return dao.selectAll();
	}

	public List<ExpenditureDto> getOrdersByDate(String date) {
		return null;
	}

	public int deleteOrderById(int orderId) {
		return 0;
	}

	public int addOrder(ExpenditureDto dto) {
		return 0;
	
	}

	public List<ExpenditureDto> selectByDate(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		Map<String , Date> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return dao.selectByDate(map);
	}




}