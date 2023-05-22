package com.linker.finance.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.finance.dto.RevenueDto;

@Mapper
public interface RevenueDao {
	public List<RevenueDto> selectAll(); 
	
	public List<RevenueDto> selectByDate(Map<String, Date> map);
	}
	