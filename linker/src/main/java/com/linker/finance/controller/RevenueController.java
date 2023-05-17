package com.linker.finance.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.linker.finance.dto.RevenueDto;
import com.linker.finance.service.RevenueService;

@Controller
@RequestMapping("/revenue")
public class RevenueController {
	@Autowired
	private RevenueService revenueService;
	
	@GetMapping("/ingredient")
	public String getAllIngredient(Model m) {
		
		List<RevenueDto> list = revenueService.getAllIngredient();
		System.out.println(list);
		System.out.println(list.size()); //저장된 객체 확인 (잘 가져온다면 쓸 필요는 없다)
		m.addAttribute("Ilist",list);
		
		return "finance/revenue";
	}

	@RequestMapping("/filtered_data")
	@ResponseBody
	public String fetchFilterdData(
			@RequestParam("start-date") @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate,
			@RequestParam("end-date") @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
			Model model) {
		 List<RevenueDto> filterData = revenueService.selectByDate(startDate, endDate);
		 
		 Gson gson = new Gson();
		 String list = gson.toJson(filterData);
		 
		 return list;
	}
	
	

}
