package com.linker.finance.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.finance.dto.ExpenditureDto;

@Mapper
public interface ExpenditureDao {
	public List<ExpenditureDto> selectAll(); 
	
	public List<ExpenditureDto> selectByDate(Map<String, Date> map);
	}
	