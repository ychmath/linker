package com.linker.finance.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.linker.finance.dao.ProfitDao;
import com.linker.finance.dto.ProfitDto;

@Service
public class ProfitService {
    @Autowired
    ProfitDao dao;

    public int insert(ProfitDto dto) {
        return dao.insert(dto);
    }

    public List<ProfitDto> selectAll() {
        return dao.selectAll();
    }

    public List<ProfitDto> selectByDate(String date) {
        return dao.selectByDate(date);
    }

    public int deleteById(int orderId) {
        return dao.deleteById(orderId);
    }

	public List<ProfitDto> getAllOrders() {
	    return dao.selectAll();
	}

	public List<ProfitDto> getOrdersByDate(String date) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deleteOrderById(int orderId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int addOrder(ProfitDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}
}