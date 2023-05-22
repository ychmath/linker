package com.linker.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.linker.admin.dto.AdminDto;

@Mapper
public interface AdminDao {
	// 회원 승인
	
	// 공지사항 게시글 작성
	int writeNotice(AdminDto dto);

	// 회원 정보 수정
	int updateUser(AdminDto dto);
	
	// 문의사항 게시글 수정
	int updateInquiry(AdminDto dto);
	
	// 공지사항 게시글 수정
	int updateNotice(AdminDto dto);

	// 회원 삭제
	int deleteUser(String userid);

	// 문의사항 게시글 삭제
	int deleteInquiry(int inquirypostid);
	
	// 공지사항 게시글 삭제
	int deleteNotice(int noticepostid);

	// 회원 수 가져오기
	int userCount();
	
	// 선택한 회원 가져오기
	AdminDto getUserInfo(String userid);

	// 회원 리스트 가져오기
	List<AdminDto> userList(Map<String, Object> m);
	
	// 문의사항 게시글 수 가져오기
	int inquiryCount();
	
	// 선택한 문의사항 게시글 가져오기
	AdminDto getInquiry(int inquirypostid);

	// 문의사항 게시글 목록 가져오기
	List<AdminDto> inquiryList(Map<String, Object> m);

	// 공지사항 게시글 수 가져오기
	int noticeCount();

	// 선택한 공지사항 게시글 가져오기
	AdminDto getNotice(int noticepostid);
	
	// 공지사항 게시글 목록 가져오기
	List<AdminDto> noticeList(Map<String, Object> m);

}
