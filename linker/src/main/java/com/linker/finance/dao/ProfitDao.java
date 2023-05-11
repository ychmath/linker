package com.linker.finance.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.linker.finance.dto.ProfitDto;

@Mapper
public interface ProfitDao {
	public int insert(ProfitDto dto);

	@Select("select ticketorderid, tt.tickettypeid , tickettypename,quantity,orderdate, price * quantity as price from tickettype tt inner join ticketorder tto on tt.tickettypeid = tto.tickettypeid")
	public List<ProfitDto> selectAll();

	@Select("select ticketorderid, tt.tickettypeid , tickettypename,quantity,orderdate, price * quantity as price from tickettype tt inner join ticketorder tto on tt.tickettypeid = tto.tickettypeid where orderdate >= #{startDate} AND orderdate <= #{endDate}")
	public List<ProfitDto> selectByDate(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

	public int deleteById(int orderId);
}