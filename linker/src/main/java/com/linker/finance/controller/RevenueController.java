package com.linker.finance.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.linker.finance.dto.RevenueDto;
import com.linker.finance.service.RevenueService;

@Controller

//@RequestMapping("/revenue")
public class RevenueController {
	@Autowired
	private RevenueService revenueService;

	@GetMapping("/ingredient")
	public String getAllIngredient(Model m) {

		List<RevenueDto> list = revenueService.getAllIngredient();
		m.addAttribute("Ilist", list);

		return "finance/revenue";
	}

	@GetMapping("/ingredient/{date}")
	public List<RevenueDto> getOrdersByDate(@PathVariable String date) {
		return revenueService.getOrdersByDate(date);
	}

	@PostMapping("/ingredient")
	public int addOrder(@RequestBody RevenueDto dto) {
		return revenueService.addOrder(dto);
	}

	@DeleteMapping("/ingredient/{orderId}")
	public int deleteOrderById(@PathVariable int orderId) {
		return revenueService.deleteOrderById(orderId);
	}

	public String selectAll(RevenueDto revenue) {

		return "";
	}

	@RequestMapping("/filtered_data_i")
	@ResponseBody
	public String fetchFilteredData(@RequestParam("start-date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
			@RequestParam("end-date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate, Model model) {

		List<RevenueDto> filteredData = revenueService.selectByDate(startDate, endDate);

		Gson gson = new Gson();
		String list = gson.toJson(filteredData);

		return list;
	}
	
//	------------------------------------------------------------
	
	@GetMapping("/finance/revenue")
	public String revenue() {
		return "finance/revenue";
	}

}