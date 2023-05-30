package com.linker.payment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.payment.dto.PhoneDto;

@Mapper
public interface PhoneDao {
	
	public int updateTicketQuantityByPhone(Map<String , Object> map);
	
	List<Integer> tickettypeidList();

	List<PhoneDto> gettypename();
}
