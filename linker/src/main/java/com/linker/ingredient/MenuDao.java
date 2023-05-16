package com.linker.ingredient;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MenuDao {
	// 게시글 작성
	int write(MenuDto dto);
	// 게시글 목록 가져오기
	List<MenuDto> menuList(Map<String, Object> m);
	// 전체 글 개수
	int count();
	// 게시글 선택
	MenuDto menuOne(int menuID);
	// 메뉴 수정
	int updateMenu(MenuDto dto);
	// 메뉴 삭제
	int deleteMenu(int menuID);

}
