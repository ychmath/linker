package com.linker.ingredient.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.linker.ingredient.dto.UseDetailDto;
import com.linker.ingredient.service.UseDetailService;

@Controller
public class UseDetailController {
	@Autowired
	UseDetailService service;
	
	// 사용 내역 출력
	@GetMapping("inventory/useDetailList")
	public String getInvenList(@RequestParam(name = "p", defaultValue = "1")int page, Model m) {
		int count = service.useCount();
		
		if (count > 0) {
			int perPage = 10; // 한 페이지 당 보일 글의 개수
			int startRow = (page - 1) * perPage;

			List<UseDetailDto> useList = service.useList(startRow);

			m.addAttribute("useList", useList);

			int pageNum = 10;
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
		
		return "/usedetail/useDetailList";
	}
	
	// 이름별 검색 결과
	@GetMapping("inventory/useSearchByName/result")
	public String useNameSearchResult(@RequestParam(name = "p", defaultValue = "1") int page, Model m, String name) {

		int resultCount = service.useNameCount(name);

		if (resultCount > 0) {
			int perPage = 10; // 한 페이지 당 보일 글의 개수
			int startRow = (page - 1) * perPage;

			List<UseDetailDto> useNameSearchResult = service.getUseByName(startRow, name);

			m.addAttribute("nameSearchResult", useNameSearchResult);

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

		return "/usedetail/useSearchByName";
	}
	
	// 날짜별 검색 결과
	@GetMapping("/inventory/SearchByUseDate/result")
	public String useDateSearchResult(@RequestParam(name = "p", defaultValue = "1") int page, Model m, @DateTimeFormat(pattern="yyyy-MM-dd") Date startDay,
			@DateTimeFormat(pattern="yyyy-MM-dd") Date endDay) {

		int resultCount = service.useDateCount(startDay, endDay);

		if (resultCount > 0) {
			int perPage = 10; // 한 페이지 당 보일 글의 개수
			int startRow = (page - 1) * perPage;

			List<UseDetailDto> usedateSearchResult = service.getByUseDate(startRow, startDay, endDay);

			m.addAttribute("usedateSearchResult", usedateSearchResult);

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

		return "/usedetail/useSearchByDate";
	}
	// 사용 내역 추가 폼 반환
	@GetMapping("/inventory/addUseDetail")
	public String addUseDetail(Model m) {
		List<UseDetailDto> list = service.inventoryIngredient();
		m.addAttribute("inventoryIngredient", list);

		return "/usedetail/addUseDetail";
	}
	
	// 식자재 이름별로 인벤토리 반환
	@RequestMapping("/inventory/getInvenIngredient")
	@ResponseBody
	public String getInvenbyIngredient(int ingredientid, Model m) {
		m.addAttribute("ingredientid", ingredientid);
		List <UseDetailDto> UseIngredinetList = service.getInvenList(ingredientid);
		m.addAttribute("idInven", UseIngredinetList);
		
		Gson gson = new Gson();
		String invenById = gson.toJson(UseIngredinetList);
		
		return invenById;
	}
	
	// 식자재 사용 내역 추가
	@PostMapping("/inventory/addUse")
	public String useInventory(UseDetailDto dto) {
		service.useInventory(dto);
		return "redirect:/inventory/useDetailList";
	}
	
	// 삭제 내역 추가 폼 반환
	@GetMapping("/inventory/deleteUseDetail")
	public String deleteUseDetail() {
		return "/usedetail/deleteUseDetail";
	}

	// 식자재 사용 내역 삭제
	@DeleteMapping("/inventory/deleteUse/{inventoryid}")
	@ResponseBody
	public void deleteUseage(@PathVariable int inventoryid) {
		service.deleteUseage(inventoryid);
	}
}
