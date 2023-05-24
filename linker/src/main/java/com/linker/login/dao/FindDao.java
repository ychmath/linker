package com.linker.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.linker.login.dto.LoginDto;

@Mapper
public interface FindDao {

	public LoginDto findByUserId(String userid);

	public String findId(LoginDto dto);

	public LoginDto findByUsername(String userid);
	public int updateUserPassword(LoginDto user);

}
