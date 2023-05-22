package com.linker.finance.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.finance.dto.ProfitDto;

@Mapper
public interface ProfitDao {

	public List<ProfitDto> selectAll();

	public List<ProfitDto> selectByDate(Map<String, Date> map);

}