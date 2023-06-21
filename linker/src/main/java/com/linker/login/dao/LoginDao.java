package com.linker.login.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.linker.login.dto.LoginDto;

@Mapper

public interface LoginDao {

	public int insertUser(LoginDto dto);

	public int updateUser(LoginDto dto);

	public int deleteUser(String userid);
	
	public int deleteInquiryPost(String userid);

	public String idCheck(String userid);

	public LoginDto login(LoginDto dto);

	List<LoginDto> userInfo();
	
	public int getSellerCount();
	
	public int getBuyerCount();
}