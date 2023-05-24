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
import com.linker.finance.dto.ExpenditureDto;
import com.linker.finance.service.ExpenditureService;

@Controller
@RequestMapping("/finance")
public class ExpenditureController {
	@Autowired
	private ExpenditureService eService;

	@GetMapping("/expenditure")
	public String getAllIngredient(Model m) {

		List<ExpenditureDto> list = eService.getAllIngredient();
		m.addAttribute("elist", list);

		return "finance/expenditure";
	}

	@GetMapping("/expenditure/{date}")
	public List<ExpenditureDto> getOrdersByDate(@PathVariable String date) {
		return eService.getOrdersByDate(date);
	}

	@PostMapping("/expenditure")
	public int addOrder(@RequestBody ExpenditureDto dto) {
		return eService.addOrder(dto);
	}

	@DeleteMapping("/expenditure/{orderId}")
	public int deleteOrderById(@PathVariable int orderId) {
		return eService.deleteOrderById(orderId);
	}

	public String selectAll(ExpenditureDto expenditure) {

		return "";
	}

	@RequestMapping("/filtered_data_ex")
	@ResponseBody
	public String fetchFilteredData(@RequestParam("start-date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
			@RequestParam("end-date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate, Model model) {

		List<ExpenditureDto> filteredData = eService.selectByDate(startDate, endDate);

		Gson gson = new Gson();
		String list = gson.toJson(filteredData);

		return list;
	}

}