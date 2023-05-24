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
import com.linker.finance.dto.SalesDto;
import com.linker.finance.service.SalesService;

@Controller
@RequestMapping("/finance")
public class SalesController {
	@Autowired
	private SalesService sService;

	@GetMapping("/sales")
	public String getAllOrders(Model m) { // model - 뷰에 전달될 데이터 view - 화면을 만들 jsp

		List<SalesDto> list = sService.getAllOrders();
		m.addAttribute("slist", list);

		return "finance/sales";
	}

	@GetMapping("/sales/{date}")
	public List<SalesDto> getOrdersByDate(@PathVariable String date) {
		return sService.getOrdersByDate(date);
	}

	@PostMapping("/sales")
	public int addOrder(@RequestBody SalesDto dto) {
		return sService.addOrder(dto);
	}

	@DeleteMapping("/sales/{orderId}")
	public int deleteOrderById(@PathVariable int orderId) {
		return sService.deleteOrderById(orderId);
	}

	public String selectAll(SalesDto sales) {

		return "";
	}

	@RequestMapping("/filtered_data_sa")
	@ResponseBody
	public String fetchFilteredData(@RequestParam("start-date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
			@RequestParam("end-date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate, Model model) {

		List<SalesDto> filteredData = sService.selectByDate(startDate, endDate);

		Gson gson = new Gson();
		String list = gson.toJson(filteredData);

		return list;
	}

}
