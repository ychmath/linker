package com.linker.inquiry.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.linker.inquiry.dto.InquiryDto;

@Mapper
public interface InquiryDao {

	@Insert("insert into inquirypost(userid, title, content, creationdate, ref, restep, relevel) values(#{userid}, #{title}, #{content}, now(), #{ref}, #{restep}, #{relevel})")
	@Options(useGeneratedKeys = true, keyProperty = "inquirypostid")
	/*@Options: insert문을 실행할 때 자동 생성되는 키 값을 매핑할 때 사용
	 * useGeneratedKeys: 자동 생성되는 키 값 사용 여부를 설정. true값으로 설정 시 자동 생성되는 키를 사용하도록 함
	 * keyProperty: 자동 생성된 키를 매핑할 객체의 프로퍼티명을 지정함. 이 값을 설정해야 MyBatis가 자동 생성된 키 값을 객체에 매핑할 수 있음
	 */
	public int insertInquiry(InquiryDto dto);
	
	@Update("update inquirypost set title=#{title}, content=#{content} where inquirypostid=#{inquirypostid}")
	public int updateInquiry(InquiryDto dto);
	
	@Update("update inquirypost set ref = #{inquirypostid} where inquirypostid=#{inquirypostid}") //제목글일때만
	public int updateRef(int inquirypostid);
	
	@Update("update inquirypost set restep = restep + 1 where ref = #{ref} and restep > #{restep} ")
	public int updateStep(InquiryDto dto);
	//후속 댓글들이 이전 댓글보다 아래쪽에 위치하도록 하기 위해서, 해당 개시물의 restep 값을 1 증가시키는 것
	
	@Update("update inquirypost set readcount = readcount + 1 where inquirypostid = #{inquirypostid}")
	public int updateReadcount(int inquirypostid);
	
	@Delete("delete from inquirypost where inquirypostid=#{inquirypostid}")
	public int deleteInquiry(int inquirypostid);
	
	@Select("select * from inquirypost order by creationdate desc, inquirypostid desc, ref desc, restep asc limit #{start}, #{count} ")
	List<InquiryDto> inquiryList(Map<String, Object> m);
	
	@Select("select * from inquirypost where inquirypostid=#{inquirypostid}")
	public InquiryDto inquiryOne(int inquirypostid);
	
	@Select("select count(*) from inquirypost")
	public int count();
	
	List<InquiryDto> inquiryListSearch(Map<String, Object> m);

	int countSearch(Map<String, Object> m); //검색 글 갯수
	
}
