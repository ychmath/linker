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
import com.linker.ticket.dto.TicketuseDto;
import com.linker.ticket.service.TicketuseService;

@Controller
public class TicketuseController {

	@Autowired
	private TicketuseService tuService; 
 
	@GetMapping("/ticketu")  //전체 식권 사용 내역 조회
	public String getAllTicketuse(Model m) {

		List<TicketuseDto> list = tuService.getAllTicketuse();
		m.addAttribute("tulist", list);

		return "ticketuse/ticketu";
	}

	@GetMapping("/ticketu/{date}") //특정 날짜의 사용된 티켓 조회
	public List<TicketuseDto> getUsedByDate(@PathVariable Date startdate, Date endDate) {
		return tuService.getUsedByDate(startdate, endDate);
	}

	@PostMapping("/ticketu") //식권 사용 추가 메서드
	public int addUse(@RequestBody TicketuseDto dto) {
		return tuService.addUse(dto);
	}

	@DeleteMapping("/ticket/{tickettypename}") //식권 타입별 식권 주문 삭제
	public int deleteOrderById(@PathVariable int tickettypename) {
		return tuService.deleteOrderById(tickettypename);
	}

	//필터링된 식권 사용 내역 조회(특정 기간 내)
	@RequestMapping("/filtered_data_u")
	@ResponseBody
	public String fetchFilteredData(@RequestParam("start-date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
			@RequestParam("end-date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate, Model model) {
		List<TicketuseDto> filterData = tuService.selectByDate(startDate, endDate);

		Gson gson = new Gson();
		String list = gson.toJson(filterData);
		return list;
	}

}