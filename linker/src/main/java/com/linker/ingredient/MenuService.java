package com.linker.ingredient;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuService {
	@Autowired
	MenuDao dao;
	// 전체 글 개수
	public int count() {
		return dao.count();
	}
	// 게시글 목록 가져오기
	public List<MenuDto> menuList(int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.menuList(m);
	}
	// 게시글 작성
	public int write(MenuDto dto) {
		return dao.write(dto);
	}
	// 메뉴 수정
	public int updateMenu(MenuDto dto) {
		return dao.updateMenu(dto);
	}
	// 메뉴 삭제
	public int deleteMenu(int menuID) {
		return dao.deleteMenu(menuID);
	}
	// 게시글 선택
	public MenuDto menuOne(int menuID) {
		return dao.menuOne(menuID);
	}
}
