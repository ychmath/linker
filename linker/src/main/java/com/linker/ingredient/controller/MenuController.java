package com.linker.ingredient.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.linker.ingredient.dto.MenuDto;
import com.linker.ingredient.service.MenuService;

@Controller
public class MenuController {
 
	  @Autowired
	  MenuService service;

	  @GetMapping("/menu/write")
	  public String writeForm() {
		  return "menu/write";
	  }
	  
	  @PostMapping("/menu/write")
	  public String write(MenuDto dto) {
		  service.write(dto);
		  return "redirect:/menu/list"; 
	  }

	  @RequestMapping("/menu/list")
	  public String menuList(@RequestParam(name = "p", defaultValue = "1") int page, Model m) { // 글이 있는지 체크 
		  int count = service.count();

		  if (count > 0) {
			  int perPage = 10; // 한 페이지 당 보일 글의 개수 
			  int startRow = (page - 1) * perPage;
				  
			  List<MenuDto> menuList = service.menuList(startRow);
				  
			  m.addAttribute("menuList", menuList);
				  
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
		  
		  return "menu/list";  

	  }
	  
	  @GetMapping("menu/content/{menuID}")
	  public String content(@PathVariable int menuID, Model m) { 
		  MenuDto dto = service.menuOne(menuID);
		  m.addAttribute("dto", dto);
		  return "menu/content";
		  }
	  
	  @GetMapping("menu/update/{menuID}")
	  public String updateForm(@PathVariable int menuID, Model m) { 
		  MenuDto dto = service.menuOne(menuID);
		  m.addAttribute("dto", dto);
		  return "menu/updateForm";
		  
	  }
	  
	  @PutMapping("/menu/update/{menuID}")
	  public String update(@PathVariable int menuID, MenuDto dto) {
		  service.updateMenu(dto);
		  return "redirect:/menu/content/{menuID}"; 
	  }
	  
	  @DeleteMapping("/menu/delete/{menuID}")
	  @ResponseBody
	  public String deleteMenu(@PathVariable int menuID) { 
		  service.deleteMenu(menuID);
		  return "/menu/list";
	  }
}
