package com.linker.ticket.controller;

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
import com.linker.ticket.dto.TicketorderDto;
import com.linker.ticket.service.TicketorderService;

@Controller
@RequestMapping("/ticketorder")
public class TicketorderController {
	@Autowired
	private TicketorderService ticketorderService;
	
	@GetMapping("/ticket")
	public String getAllTicketorder(Model m) {
		
		List<TicketorderDto> list = ticketorderService.getAllTicketorder();
		m.addAttribute("tlist", list);
		
		return "ticket/ticketorder";
	}
	
	@GetMapping("/ticket/{date}")
	public List<TicketorderDto> getOrdersByDate(@PathVariable String date) {
		return ticketorderService.getOrdersByDate(date);
	}

	@PostMapping("/ticket")
	public int addOrder(@RequestBody TicketorderDto dto) {
		return ticketorderService.addOrder(dto);
	}

	@DeleteMapping("/ticket/{orderId}")
	public int deleteOrderById(@PathVariable int orderId) {
		return ticketorderService.deleteOrderById(orderId);
	}

	public String selectAll(TicketorderDto revenue) {
		return "";
	}
	
	@RequestMapping("/filtered_data_t")
	@ResponseBody
	public String fetchFilteredData(
			@RequestParam("start-date") @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate,
			@RequestParam("end-date") @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
			Model model) {
		List<TicketorderDto> filterData = ticketorderService.selectByDate(startDate,endDate);
		
		Gson gson = new Gson();
		String list = gson.toJson(filterData);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
}
