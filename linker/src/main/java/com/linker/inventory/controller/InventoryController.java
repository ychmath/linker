package com.linker.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.linker.inventory.dto.InventoryDto;
import com.linker.inventory.service.InventoryService;

@Controller
public class InventoryController {
	@Autowired
	InventoryService service;
	
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
		
}
