 package com.linker.ticket.dao;
  
import java.util.Date; 
import java.util.List; import java.util.Map;
  
import org.apache.ibatis.annotations.Mapper; 
import com.linker.ticket.dto.TicketuseDto;
@Mapper 
	public interface TicketuseDao { 
	public List<TicketuseDto> selectAll();
  
	 List<TicketuseDto> selectByDate(Map<String, Date> map);
  
	/* public interface TicketUseMapper{ */
		 public int updateTicketQuantityByPhone(String phone);
	 }
  
 