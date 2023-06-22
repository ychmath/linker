package com.linker.payment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.payment.dto.PhoneDto;
import com.linker.ticket.dto.TicketUseDto;

@Mapper
public interface PhoneDao {
	
	public int updateTicketQuantityByPhone(Map<String , Object> map);
	public int insertTicketuseByphone(TicketUseDto dto);
	List<Integer> tickettypeidList();

	List<PhoneDto> gettypename();
	
	String getidbyphone(String phone);
	
}
