package com.linker.ingredient.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.linker.ingredient.dto.ListDto;
import com.linker.ingredient.service.ListService;

@Controller
public class ListController {
	@Autowired
	ListService service;

	// 재료 목록 출력 메인
	@GetMapping("ingredient/ingredientList")
	public String ingredientListMain(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {

		int count = service.ingredientCount();

		if (count > 0) {
			int perPage = 10; // 한 페이지 당 보일 글의 개수
			int startRow = (page - 1) * perPage;

			List<ListDto> ingredientList = service.getIngredient(startRow);

			m.addAttribute("ingredientList", ingredientList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;

			if (end > totalPages) {
				end = totalPages;
			}

			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}

		m.addAttribute("count", count);

		return "list/ingredientList";
	}

	// 검색 결과 보이기
	@GetMapping("ingredient/searchbyname/result")
	public String nameSearchResult(@RequestParam(name = "p", defaultValue = "1") int page, Model m, String name) {

		int resultCount = service.nameSearchCount(name);

		if (resultCount > 0) {
			int perPage = 10; // 한 페이지 당 보일 글의 개수
			int startRow = (page - 1) * perPage;

			List<ListDto> nameSearchResult = service.getIngredientByName(startRow, name);

			m.addAttribute("nameSearchResult", nameSearchResult);

			int pageNum = 5;
			int totalPages = resultCount / perPage + (resultCount % perPage > 0 ? 1 : 0); // 전체 페이지 수
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;

			if (end > totalPages) {
				end = totalPages;
			}

			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}

		m.addAttribute("count", resultCount);

		return "list/searchNameResult";
	}

	// 날짜별 검색 결과 보이기
	@GetMapping("ingredient/searchbydate/result")
	public String dateSearchResult(@RequestParam(name = "p", defaultValue = "1") int page, Model m, Date startDay,
			Date endDay) {

		int resultCount = service.expSearchCount(startDay, endDay);

		if (resultCount > 0) {
			int perPage = 10; // 한 페이지 당 보일 글의 개수
			int startRow = (page - 1) * perPage;

			List<ListDto> expSearchResult = service.getIngredientByExp(startRow, startDay, endDay);

			m.addAttribute("expSearchResult", expSearchResult);

			int pageNum = 5;
			int totalPages = resultCount / perPage + (resultCount % perPage > 0 ? 1 : 0); // 전체 페이지 수
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;

			if (end > totalPages) {
				end = totalPages;
			}

			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}

		m.addAttribute("count", resultCount);

		return "list/searchDateResult";
	}

	// 식자재 삭제/추가 페이지
	@GetMapping("ingredient/change")
	public String changeList(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = service.ingredientCount();

		if (count > 0) {
			int perPage = 10; // 한 페이지 당 보일 글의 개수
			int startRow = (page - 1) * perPage;

			List<ListDto> ingredientList = service.getIngredient(startRow);

			m.addAttribute("ingredientList", ingredientList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;

			if (end > totalPages) {
				end = totalPages;
			}

			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}

		return "list/change";
	}

	// 식자재 삭제
	@DeleteMapping("/ingredient/delete/{ingredientid}")
	@ResponseBody
	public void deleteIngredient(@PathVariable int ingredientid) {
		service.deleteIngredient(ingredientid);

	}

	// 식자재 추가
	@PostMapping("/ingredient/insert")
	public String addIngredient(ListDto newList) {
		service.addIngredient(newList);
		return "redirect:/ingredient/change";
	}

	// 식자재 수정(대상 식자재 정보 가져오기 / 폼 반환)
	@GetMapping("/ingredient/update/{ingredientid}")
	public String updateListForm(@PathVariable int ingredientid, Model m) {
		ListDto dto = service.getIngredientByID(ingredientid);
		m.addAttribute("dto", dto);
		return "list/updateListForm";
	}

	// 식자재 수정(대상 식자재 수정)
	@PutMapping("/ingredient/update/{ingredientid}")
	public String updateIngredient(@PathVariable int ingredientid, ListDto dto, Model m) {
		service.updateIngredient(dto);

		return "redirect:/ingredient/ingredientList";
	}

}