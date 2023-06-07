package com.linker.ticket.dao;

import java.util.List;
import java.util.Map;

//import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
//import org.apache.ibatis.annotations.Select;

import com.linker.ticket.dto.TicketOrderDto;

@Mapper
public interface TicketOrderDao {

	//@Insert("insert into ticketorder(ticketorderid, userid, tickettype, quantity, orderdate) values(#{ticketorderid}, #{userid}, #{tickettype}, #{quantity}, now())")
	public int buyTicket(TicketOrderDto dto);
	
	//@Select("select userid, ticketorderid, orderdate, tickettypename as tickettype, price, quantity, price * quantity as totalprice from ticketorder tto, ticketnum ttn where tto.tickettype = ttn.tickettype and userid = #{userid} order by orderdate desc limit #{start}, #{count}")
	List<TicketOrderDto> selectAll(Map<String, Object> m);
	
	//@Select("select ticketorderid, orderdate, tickettypename as tickettype, price, quantity, price * quantity as totalprice from ticketorder tto, ticketnum ttn where tto.tickettype = ttn.tickettype and userid = #{userid} and orderdate between #{startDate} and #{endDate} order by orderdate desc")
	public List<TicketOrderDto> selectByDate(Map<String, Object> m);
	
	//@Select("select count(*) from ticketorder where userid = #{userid}")
	public int count(String userid);
	
	
	int selectByDateCount(Map<String, Object> m);
	

}
