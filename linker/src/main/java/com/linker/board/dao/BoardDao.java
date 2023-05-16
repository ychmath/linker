package com.linker.board.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.linker.board.dto.BoardDto;

@Mapper
public interface BoardDao {

	@Insert("insert into noticepost(noticepostid, user_userid, title, content, creationdate values(#{noticepostid}, #{user_userid}, #{title}, #{content}, now())")
	public int insertNotice(BoardDto dto);
	
	@Update("update noticepost set title=#{title}, content=#{content} where noticepostid=#{noticepostid}")
	public int updateNotice(BoardDto dto);
	
}
