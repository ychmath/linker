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
import com.linker.ticket.dto.TicketOrderDto;
import com.linker.ticket.service.TicketOrderService;

@Controller
public class TicketOrderController {
	@Autowired
	private TicketOrderService toService; 
 
	@GetMapping("/ticketorder")  //전체 식권 사용 내역 조회
	public String getAllTicketorder(Model m) {

		List<TicketOrderDto> list = toService.getAllTicketOrder();
		m.addAttribute("tolist", list);

		return "ticket/ticketorderform";
	}

	@GetMapping("/ticketorder/{date}") //특정 날짜의 사용된 티켓 조회
	public List<TicketOrderDto> getOrderByDate(@PathVariable Date startdate, Date endDate) {
		return toService.selectByDate(startdate, endDate);
	}

	@PostMapping("/ticketorder") //식권 사용 추가 메서드
	public int addOrder(@RequestBody TicketOrderDto dto) {
		return toService.addUse(dto);
	}

	@DeleteMapping("/ticketorder/{tickettypename}") //식권 타입별 식권 주문 삭제
	public int deleteOrderById(@PathVariable int tickettypename) {
		return toService.deleteOrderById(tickettypename);
	}

	//필터링된 식권 사용 내역 조회(특정 기간 내)
	@RequestMapping("/filtered_data_o")
	@ResponseBody
	public String fetchFilteredData(@RequestParam("start-date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
			@RequestParam("end-date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate, Model model) {
		List<TicketOrderDto> filterData = toService.selectByDate(startDate, endDate);

		Gson gson = new Gson();
		String list = gson.toJson(filterData);
		return list;
	}
}
