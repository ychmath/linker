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
import com.linker.ticket.dto.TicketuseDto;
import com.linker.ticket.service.TicketuseService;

@Controller
//@RequestMapping("/ticketuse")
public class TicketuseController {

	@Autowired
	private TicketuseService tuService; 

	@GetMapping("/ticketu")
	public String getAllTicketuse(Model m) {

		List<TicketuseDto> list = tuService.getAllTicketuse();
		m.addAttribute("tulist", list);

		return "ticketuse/ticketu";
	}

	@GetMapping("/ticketu/{date}")
	public List<TicketuseDto> getUsedByDate(@PathVariable Date startdate, Date endDate) {
		return tuService.getUsedByDate(startdate, endDate);
	}

	@PostMapping("/ticketu")
	public int addUse(@RequestBody TicketuseDto dto) {
		return tuService.addUse(dto);
	}

	@DeleteMapping("/ticket/{tickettypename}")
	public int deleteOrderById(@PathVariable int tickettypename) {
		return tuService.deleteOrderById(tickettypename);
	}

	public String selectAll(TicketuseDto ticketu) {
		return "";
	}

	@RequestMapping("/filtered_data_u")
	@ResponseBody
	public String fetchFilteredData(@RequestParam("start-date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
			@RequestParam("end-date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate, Model model) {
		List<TicketuseDto> filterData = tuService.selectByDate(startDate, endDate);

		Gson gson = new Gson();
		String list = gson.toJson(filterData);
		return list;
	}
	
	@GetMapping("/useticket")
	public String useTicketForm(){
		return "ticket/ticketuseform";
	}
	
	@PostMapping("/useticket")
	public String useTicket(String tickettypename,String phone) {
		return "redirect:/"; 
	}
	@PostMapping("/tiketuse/use")
	@ResponseBody
	public String useTicketVerified(
	@RequestParam("tickettypename") String tickettypename,		) {
		
	}
} 
