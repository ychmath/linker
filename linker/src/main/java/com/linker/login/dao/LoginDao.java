package com.linker.login.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.linker.login.dto.LoginDto;



@Mapper
public interface LoginDao {

	public int insertUser(LoginDto dto);
	
	public int updateUser(LoginDto dto);

	public int deleteUser(String userid);
	
	public String idCheck(String userid);

	public LoginDto login(LoginDto dto);
	
	List<LoginDto> userInfo();

	public String emailCheck(String email);
	
	public String getPassword(@Param("userid") String userid);
	
	public LoginDto findUserById(String userid);
}