package com.linker.ticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.linker.ticket.dto.TicketOrderDto;
import com.linker.ticket.service.TicketService;


@SessionAttributes("user")
@Controller
public class TicketController {

	@Autowired
	TicketService service;
	
	@ModelAttribute("user")
	public TicketOrderDto getDto() {
		return new TicketOrderDto();
	}
	
	
	@GetMapping("/ticket/buyTicket")
	public String buyTicket() {
		return "ticket/buyTicket";
	}
	
}
