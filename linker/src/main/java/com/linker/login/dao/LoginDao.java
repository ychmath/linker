package com.linker.login.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.linker.login.dto.LoginDto;

@Mapper
public interface LoginDao {


	@Insert("insert into user(userid, password, name, email, phone, role, signupdate) values(#{userid}, #{password}, #{name}, #{email}, #{phone}, #{role}, now())")

	public int insertUser(LoginDto dto);
	
	@Update("update user set password=#{password} where userid=#{userid}")
	public int updateUser(LoginDto dto);
	
	@Delete("delete from user where userid=#{userid}")
	public int deleteUser(String id);
	
	@Select("select userid from user where userid=#{userid}")
	public String idCheck(String id);
	
	@Select("select * from user where userid=#{userid} and password=#{password}")
	public LoginDto login(LoginDto dto);
	
	@Select("select userid, name, email, role from user")
	List<LoginDto> userInfo();

	public String emailCheck(String email);

	public LoginDto findByUserId(String userid);
}