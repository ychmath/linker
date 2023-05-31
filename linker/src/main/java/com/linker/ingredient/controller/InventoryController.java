package com.linker.ingredient.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.linker.ingredient.dto.InventoryDto;
import com.linker.ingredient.service.InventoryService;

@Controller
public class InventoryController {
	@Autowired
	InventoryService service;

	// 인벤토리 목록 출력
	@GetMapping("inventory/inventoryList")
	public String getInvenList(@RequestParam(name = "p", defaultValue = "1")int page, Model m) {
		int count = service.inventoryCount();
		
		if (count > 0) {
			int perPage = 10; // 한 페이지 당 보일 글의 개수
			int startRow = (page - 1) * perPage;

			List<InventoryDto> invenList = service.getInvenList(startRow);

			m.addAttribute("invenList", invenList);

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
		
		return "inventory/inventoryList";
	}
	
	// 이름 검색 결과
	@GetMapping("inventory/searchbyname/result")
	public String nameSearchResult(@RequestParam(name = "p", defaultValue = "1") int page, Model m, String ingredientname) {

		int resultCount = service.invennameSearchCount(ingredientname);
		
		m.addAttribute("count", resultCount);

		if (resultCount > 0) {
			int perPage = 10; // 한 페이지 당 보일 글의 개수
			int startRow = (page - 1) * perPage;

			List<InventoryDto> nameSearchResult = service.getInventoryByName(startRow, ingredientname);

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
		return "inventory/searchNameResult";
	}
	
	// 수령일 검색 결과
	@GetMapping("inventory/searchbyreceive/result")
	public String dateSearchResult(@RequestParam(name = "p", defaultValue = "1") int page, Model m, Date startDay,
			Date endDay) {

		int resultCount = service.ReceiveSearchCount(startDay, endDay);

		if (resultCount > 0) {
			int perPage = 10; // 한 페이지 당 보일 글의 개수
			int startRow = (page - 1) * perPage;

			List<InventoryDto> receiveSearchResult = service.getInventoryByReceive(startRow, startDay, endDay);

			m.addAttribute("receiveSearchResult", receiveSearchResult);

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

		return "inventory/searchReceiveResult";
	}
}
