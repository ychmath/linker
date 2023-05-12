package com.linker.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.linker.notice.dto.NoticeDto;

@Mapper
public interface NoticeDao {

	@Insert("insert into noticepost(noticepostid, userid, title, content, creationdate) values(#{noticepostid}, #{userid}, #{title}, #{content}, now())")
	public int insertNotice(NoticeDto dto);
	
	@Update("update noticepost set title=#{title}, content=#{content} where noticepostid=#{noticepostid}")
	public int updateNotice(NoticeDto dto);
	
	@Delete("delete from noticepost where noticepostid=#{noticepostid}")
	public int deleteNotice(int noticepostid);
	
	@Select("select * from noticepost where noticepostid=#{noticepostid}")
	public NoticeDto boardOne(int noticepostid);
	
	@Select("select * from noticepost order by creationdate desc, noticepostid desc")
	List<NoticeDto> noticeList(Map<String, Object>m);
	/* Map은 키-값 쌍으로 데이터를 관리하는 자료구조
	 * 키(key)로 문자열(String)을, 값(value)으로는 임의의 객체(Object)를 가질 수 있음
	 * String은 키의 데이터 타입을 의미. Object는 값의 데이터 타입을 의미
	 * Map은 주로 데이터를 저장하고 검색하는 데 사용 
	 */
	
	@Select("select count(*) from noticepost")
	public int count();
	
}
