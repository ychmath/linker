package com.linker.finance.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.linker.finance.dto.RevenueDto;

@Mapper
public interface RevenueDao {
	@Select("select orderid,ingredientname,orderquantity*orderprice as price,orderdate From ingredientorder inner join ingredient on ingredient.ingredientid = ingredientorder.ingredientid;")
	public List<RevenueDto> selectAll(); 
	
	@Select("select orderid,ingredientname,orderquantity*orderprice as price,orderdate From ingredientorder inner join ingredient on ingredient.ingredientid = ingredientorder.ingredientid where orderdate >= #{startDate} and orderdate <= #{endDate} order by orderdate DESC;")
	public List<RevenueDto> selectByDate(Map<String, Date> map);
	}
	