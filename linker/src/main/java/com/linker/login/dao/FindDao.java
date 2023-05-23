package com.linker.login.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.SqlSession;
import org.springframework.transaction.annotation.Transactional;

import com.linker.login.dto.LoginDto;

@Mapper
public interface FindDao {
	
	public LoginDto findByUserId(String userid);

	public String findId(LoginDto dto);

	@Select("select * from user where userid=#{userid} and email=#{email}  ")
	public LoginDto selectAll(LoginDto dto);

	@Update("update user set password=#{password} where userid=#{userid}")
	public String updatePw(LoginDto dto);
	
}
