package com.linker.ticket.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.linker.ticket.dto.TicketOrderDto;

@Mapper
public interface TicketOrderDao {

	@Insert("insert into ticketorder(ticketorderid, userid, tickettype, quantity, orderdate) values(#{ticketorderid}, #{userid}, #{tickettype}, #{quantity}, now())")
	public int buyTicket(TicketOrderDto dto);
	
	@Select("select ticketorderid, orderdate, tickettypename, price, quantity, price * quantity as totalprice \n"
			+ "from ticketorder tto, ticketnum ttn where tto.tickettype = ttn.tickettype order by orderdate desc")
	public List<TicketOrderDto> selectAll();
	
	
	@Select("select ticketorderid, orderdate, tickettypename, price, quantity, price * quantity as totalprice \n"
			+ "from ticketorder tto, ticketnum ttn where tto.tickettype = ttn.tickettype and userid = #{userid} and orderdate between #{startDate} and #{endDate} order by userdate desc")
	public List<TicketOrderDto> selectByDate(Map<String, Date> m);

//	------------------------------------------------------------------------------------------------------------
	
//	@Select("select ticketorderid, orderdate, tickettypename,  price, quantity, price * quantity AS totalprice FROM tickettype tt INNER JOIN ticketorder tto ON tt.tickettypeid = tto.tickettypeid ORDER BY orderdate DESC;")
//	public List<TicketOrderDto> selectAll();

//	@Select("select ticketorderid, orderdate, tickettypename,  price, quantity, price * quantity AS totalprice FROM tickettype tt INNER JOIN ticketorder tto ON tt.tickettypeid = tto.tickettypeid WHERE orderdate >= #{startDate} AND orderdate <= #{endDate} ORDER BY orderdate DESC;")
//	public List<TicketOrderDto> selectByDate(Map<String,Date> map);
	
	public int deleteById(int orderId);
	
}
