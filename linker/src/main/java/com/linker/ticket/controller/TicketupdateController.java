package com.linker.ticket.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.linker.ticket.dto.TicketupdateDto;
import com.linker.ticket.service.TicketUpdateService;

@Controller
public class TicketupdateController {	
	
	@Autowired
	private TicketUpdateService service;
	
	@GetMapping("/ticket/ticketlist")
	public String ticketListMain(Model m) {
		List<TicketupdateDto>ticketList = service.getTicket();
		m.addAttribute("ticketList",ticketList);
		return "ticket/ticketlist";
	}
	
	@GetMapping("/ticket/add")
	public String addTicketForm() {
		return "ticket/ticketchange";
	}
	
	@PostMapping("/ticket/insert")
	public String addTicket(TicketupdateDto newList, Model m) {
		service.addTicket(newList);
		List<TicketupdateDto>ticketList = service.getTicket();
		m.addAttribute("ticketList",ticketList);
		return "ticket/ticketlist";
	}
	
	@GetMapping("/ticket/update/{tickettypeid}")
	public String updateTicketForm(@PathVariable int tickettypeid, Model m) {
		TicketupdateDto dto = service.getTicketById(tickettypeid);
		m.addAttribute("dto", dto);
		return "ticket/ticketupdateform";
	}
	
	@PutMapping("/ticket/update/{tickettypeid}")
	public String updateTicket(@PathVariable int tickettypeid, TicketupdateDto dto, Model m) {
		service.updateTickettype(dto);
		return "redirect:/ticket/ticketlist";
		
	}

}

