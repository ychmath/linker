package com.linker.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.admin.dao.AdminDao;
import com.linker.admin.dto.AdminDto;

@Service
public class AdminService {
	@Autowired
	AdminDao dao;

	// 회원 승인
	public int grantUser(String userid) {
		return dao.grantUser(userid);
	}
	
	// 승인 대상 목록 가져오기
	public List<AdminDto> getTempSeller() {
		return dao.getTempSeller();
	}

	// 승인 대상 회원 수
	public int tempCount() {
		return dao.tempCount();
	}

	// 공지사항 게시글 작성
	public int writeNotice(AdminDto dto) {
		return dao.writeNotice(dto);
	}

	// 회원 정보 수정
	public int updateUser(AdminDto dto) {
		return dao.updateUser(dto);
	}
	
	// 문의사항 게시글 수정
	public int updateInquiry(AdminDto dto) {
		return dao.updateInquiry(dto);
	}
	
	// 공지사항 게시글 수정
	public int updateNotice(AdminDto dto) {
		return dao.updateNotice(dto);
	}

	// 회원 삭제
	public int deleteUser(String userid) {
		return dao.deleteUser(userid);
	}
	
	// 문의사항 게시글 삭제
	public int deleteInquiry(int inquirypostid) {
		return dao.deleteInquiry(inquirypostid);
	}
	
	// 공지사항 게시글 삭제
	public int deleteNotice(int noticepostid) {
		return dao.deleteNotice(noticepostid);
	}

	// 회원 수 가져오기
	public int userCount() {
		return dao.userCount();
	}

	// 선택한 회원 가져오기
	public AdminDto getUserInfo(String userid) {
		return dao.getUserInfo(userid);
	}

	// 회원 리스트 가져오기
	public List<AdminDto> userList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 5);
		return dao.userList(m);
	}

	// 문의사항 게시글 수 가져오기
	public int inquiryCount() {
		return dao.inquiryCount();
	}

	// 선택한 문의사항 게시글 가져오기
	public AdminDto getInquiry(int inquirypostid) {
		return dao.getInquiry(inquirypostid);
	}

	// 문의사항 게시글 목록 가져오기
	public List<AdminDto> inquiryList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 5);
		return dao.inquiryList(m);
	}

	// 공지사항 게시글 수 가져오기
	public int noticeCount() {
		return dao.noticeCount();
	}

	// 선택한 공지사항 게시글 가져오기
	public AdminDto getNotice(int noticepostid) {
		return dao.getNotice(noticepostid);
	}
	
	// 공지사항 게시글 목록 가져오기
	public List<AdminDto> noticeList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 5);
		return dao.noticeList(m);
	}

}