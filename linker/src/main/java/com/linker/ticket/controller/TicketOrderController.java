package com.linker.ticket.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.linker.login.dto.LoginDto;
import com.linker.ticket.dto.TicketOrderDto;
import com.linker.ticket.service.TicketOrderService;

	@SessionAttributes("user")
	@Controller
	//@RequestMapping("/ticketorder")
	public class TicketOrderController {
		
		@Autowired
		private TicketOrderService service;
		
		
		@ModelAttribute("user")
		public TicketOrderDto getDto() {
			return new TicketOrderDto();
		}
		
		@GetMapping("/ticket")
		public String getAllTicketorder(Model m) {
			
			List<TicketOrderDto> list = service.getAllTicketorder();
			m.addAttribute("tlist", list);
			
			return "ticketorder/ticket";
		}
		
		@GetMapping("/ticket/{date}")
		public List<TicketOrderDto> getOrdersByDate(@PathVariable String date) {
			return service.getOrdersByDate(date);
		}


		@DeleteMapping("/ticket/{orderId}")
		public int deleteOrderById(@PathVariable int orderId) {
			return service.deleteOrderById(orderId);
		}

		public String selectAll(TicketOrderDto revenue) {
			return "";
		}
		
		@RequestMapping("/filtered_data_t")
		@ResponseBody
		public String fetchFilteredData(
				@RequestParam("start-date") @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate,
				@RequestParam("end-date") @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
				Model model) {
			List<TicketOrderDto> filterData = service.selectByDate(startDate,endDate);
			
			Gson gson = new Gson();
			String list = gson.toJson(filterData);
			return list;
		}
		
		@GetMapping("/ticket/buyTicket")
		public String buyTicket() {
			return "ticket/buyTicket";
		}

		@PostMapping("/ticket/ticketlist")
		public String buyTicket(@ModelAttribute("user") LoginDto userid, TicketOrderDto dto) {
		service.buyTicket(dto);
		return "redirect:/main";
		}
}
