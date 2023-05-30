package com.linker.ticket.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.ticket.dto.TicketholdDto;

@Mapper
public interface PhoneDao {
	
	public int updateTicketQuantityByPhone(Map<String , Object> map);
	
	List<Integer> tickettypeidList();

	List<TicketholdDto> gettypename();
}
