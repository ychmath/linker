package com.linker.login.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.linker.login.dto.LoginDto;



@Mapper
public interface LoginDao {

	String idCheck(String id);
	int insertMem(LoginDto dto);
	LoginDto login(LoginDto dto);
	int updateMem(LoginDto dto);
	int deleteMem(String id);
	
}