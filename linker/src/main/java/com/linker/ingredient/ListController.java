package com.linker.ingredient;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ListController {
	@Autowired
	ListService service;
	
	@GetMapping("ingredient/main")
	public String ingredientListMain(@RequestParam(name = "p", defaultValue = "1") int page,
			Model m) {
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
	
	@GetMapping("ingredient/searchbyname")
	public String nameSearchForm() {
		return "list/searchByName";
	}
	
	@GetMapping("ingredient/searchbyname/result")
	public String nameSearchResult(@RequestParam(name = "p", defaultValue = "1") int page,
			Model m, String name) {

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
	
	@GetMapping("ingredient/searchbydate")
	public String dateSearchForm() {
		return "list/searchByDate";
	}
	
	@GetMapping("ingredient/searchbydate/result")
	public String dateSearchResult(@RequestParam(name = "p", defaultValue = "1") int page,
			Model m, Date startDay, Date endDay) {

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

}
