package com.linker.login.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.linker.login.dto.FindpwDto;

@Mapper
public interface FindpwDao {
	@Select("select * from user where userid=#{userid} and email=#{email}  ")
	public FindpwDto selectAll(FindpwDto dto);
	
	@Update("update user set password=#{password} where userid=#{userid}")
	public String updatePw(FindpwDto dto);

	
		
}
