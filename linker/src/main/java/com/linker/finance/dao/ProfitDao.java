package com.linker.finance.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.linker.finance.dto.ProfitDto;

@Mapper
public interface ProfitDao {

	@Select("select ticketorderid, tt.tickettypeid, tickettypename, quantity, orderdate, price * quantity AS price FROM tickettype tt INNER JOIN ticketorder tto ON tt.tickettypeid = tto.tickettypeid ORDER BY orderdate DESC;")
	public List<ProfitDto> selectAll();

	@Select("SELECT ticketorderid, tt.tickettypeid, tickettypename, quantity, orderdate, price * quantity AS price\n"
			+ "FROM tickettype tt\n"
			+ "INNER JOIN ticketorder tto ON tt.tickettypeid = tto.tickettypeid\n"
			+ "WHERE orderdate >= #{startDate} AND orderdate <= #{endDate}\n"
			+ "ORDER BY orderdate DESC;")
	public List<ProfitDto> selectByDate(Map<String, Date> map);

}