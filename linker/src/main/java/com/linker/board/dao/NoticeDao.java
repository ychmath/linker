package com.linker.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.board.dto.NoticeDto;

@Mapper
public interface NoticeDao {

	public int insertNotice(NoticeDto dto);

	public int updateNotice(NoticeDto dto);

	public int deleteNotice(int noticepostid);

	public NoticeDto boardOne(int noticepostid);

	List<NoticeDto> noticeList(Map<String, Object> m);

	/*
	 * Map은 키-값 쌍으로 데이터를 관리하는 자료구조 키(key)로 문자열(String)을, 값(value)으로는 임의의 객체(Object)를
	 * 가질 수 있음 String은 키의 데이터 타입을 의미. Object는 값의 데이터 타입을 의미 Map은 주로 데이터를 저장하고 검색하는 데
	 * 사용
	 */
	public int count();

	List<NoticeDto> noticeListSearch(Map<String, Object> m);

	int countSearch(Map<String, Object> m); // 검색 글 갯수

}
