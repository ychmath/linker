package com.linker.finance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.linker.finance.dto.ProfitDto;

@Mapper
public interface ProfitDao {
    public int insert(ProfitDto dto);
    @Select("select tt.tickettypeid, tickettypename,quantity,orderdate, price * quantity as price from tickettype tt inner join ticketorder tto on tt.tickettypeid = tto.tickettypeid")
    public List<ProfitDto> selectAll();
    public List<ProfitDto> selectByDate(String date);
    public int deleteById(int orderId);
}