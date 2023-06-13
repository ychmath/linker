package com.linker.ingredient.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		return "usedetail/useDetailList";
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

		return "usedetail/useSearchByName";
	}
}
