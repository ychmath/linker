package com.linker.inquiry.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.linker.inquiry.dto.InquiryDto;

@Mapper
public interface InquiryDao {

	@Insert("insert into inquirypost(inquirypostid, userid, title, content, creationdate, ref, restep,  relevel) values(#{inquirypostid}, #{userid}, #{title}, #{content}, now(), #{ref}, #{restep}, #{relevel})")
	public int insertInquiry(InquiryDto dto);
	
	@Update("update inquirypost set title=#{title}, content=#{content} where inquirypostid=#{inquirypostid}")
	public int updateInquiry(InquiryDto dto);
	
	@Delete("delete from inquirypost where inquirypostid=#{inquirypostid}")
	public int deleteInquiry(int inquirypostid);
	
	@Select("select * from inquirypost order by creationdate desc, inquirypostid desc")
	List<InquiryDto> inquiryList(Map<String, Object> m);
	
	@Select("select * from inquirypost where inquirypostid=#{inquirypostid}")
	public InquiryDto inquiryOne(int inquirypostid);
}
