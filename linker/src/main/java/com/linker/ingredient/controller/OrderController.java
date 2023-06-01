package com.linker.ingredient.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.linker.ingredient.dto.OrderDto;
import com.linker.ingredient.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	OrderService service;
	
	// 식자재 입고 목록 출력
	@GetMapping("inventory/orderList")
	public String orderList(@RequestParam(name = "p", defaultValue = "1")int page, Model m) {
		int count = service.orderCount();
		
		if (count > 0) {
			int perPage = 10; // 한 페이지 당 보일 글의 개수
			int startRow = (page - 1) * perPage;

			List<OrderDto> orderList = service.orderList(startRow);

			m.addAttribute("orderList", orderList);

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
		
		return "order/orderList";
	}
	
	// 이름 검색 결과
	@GetMapping("inventory/orderSearchByName/result")
	public String nameSearchResult(@RequestParam(name = "p", defaultValue = "1") int page, Model m, String name) {

		int resultCount = service.searchNameCount(name);
		
		m.addAttribute("count", resultCount);

		if (resultCount > 0) {
			int perPage = 10; // 한 페이지 당 보일 글의 개수
			int startRow = (page - 1) * perPage;

			List<OrderDto> nameSearchResult = service.orderSearchByName(startRow, name);

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

		return "order/searchNameResult";
	}

}
