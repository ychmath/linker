package com.linker.ticket.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.linker.login.dto.LoginDto;
import com.linker.ticket.dto.TicketUseDto;
import com.linker.ticket.service.TicketUseService;

@SessionAttributes("user")
@Controller
public class TicketUseController {

	@Autowired
	private TicketUseService service; 
 
	@ModelAttribute("user")
	public LoginDto getDto() {
		return new LoginDto();
	}
	
	@RequestMapping("/ticketuse/ticketuseform")
	public String selectAll(@RequestParam(name="p", defaultValue="1")int page, @ModelAttribute("user")LoginDto userid, Model m) {
		
		int count = service.count(userid.getUserid());
			if(count > 0) {
				int perPage = 10;
				int startRow = (page - 1) * perPage;
				
				List<TicketUseDto> useList = service.selectAll(startRow, userid.getUserid());
				m.addAttribute("uList", useList);
				
				int pageNum = 5;
				int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);
				int begin = (page - 1) / pageNum * pageNum + 1;
				int end = begin + pageNum - 1;
				if(end > totalPages) {
					end = totalPages;
				}
				
				m.addAttribute("pageNum", pageNum);
				m.addAttribute("totalPages", totalPages);
				m.addAttribute("begin", begin);
				m.addAttribute("end", end);
				
				//System.out.println(useList);
			}
			m.addAttribute("count", count);
			return "ticket/ticketuseform";
	}
	
	@GetMapping("/ticketuse/{date}")
	public String selectByDate(@RequestParam(name="p", defaultValue="1")int page, @ModelAttribute("user")LoginDto userid, 
								@RequestParam("start-date") @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate,
								@RequestParam("end-date") @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
								int start){
		
		Map<String, Object> m = new HashMap<>();
		
		int count = service.selectByDateCount(startDate, endDate, userid.getUserid());
		
		int perPage = 10;
		int startRow = (page - 1) * perPage;
		
		List<TicketUseDto> filterData = service.selectByDate(startDate, endDate, userid.getUserid(),startRow);
		
		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if(end > totalPages) {
			end = totalPages;
		}
		
		m.put("pageNum", pageNum);
		m.put("totalPages", totalPages);
		m.put("begin", begin);
		m.put("end", end);
		m.put("count", count);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		
		m.put("startDate",sdf.format(startDate));
		m.put("endDate",sdf.format(endDate));
		
		List<Object> filterDatas = new ArrayList<>();
		
		filterDatas.add(m);
		filterDatas.add(filterData);
		
		Gson gson = new Gson();
		String list = gson.toJson(filterDatas);
		System.out.println(list);
		return list;
	}
	
	@RequestMapping("/ticketuse/filtered_data_t")
	@ResponseBody
	public String fetchFilteredData(
			@RequestParam("start-date") @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate,
			@RequestParam("end-date") @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
			@RequestParam(value="p", defaultValue="1") int page, //페이지 번호 추가
			Model model, @ModelAttribute("user")LoginDto userid) {
		
		System.out.println(startDate+" "+endDate);
		
		Map<String, Object> m = new HashMap<>();
		
		int count = service.selectByDateCount(startDate, endDate, userid.getUserid()); //시작 날짜와 종료 날짜 사이의 티켓 주문 개수를 가져옴
		
		int perPage = 10;
		int startRow = (page - 1) * perPage;
		
		List<TicketUseDto> filterData = service.selectByDate(startDate, endDate, userid.getUserid(),startRow); //해당 페이지의 티켓 주문 데이터를 가져옴
		
		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if(end > totalPages) {
			end = totalPages;
		}
		
		m.put("pageNum", pageNum);
		m.put("totalPages", totalPages);
		m.put("begin", begin);
		m.put("end", end);
		m.put("count", count);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //가져온 날짜 데이터를 포맷팅함
		
		m.put("startDate",sdf.format(startDate));
		m.put("endDate",sdf.format(endDate));
		
		List<Object> filterDatas = new ArrayList<>();
		
		filterDatas.add(m);
		filterDatas.add(filterData);
		
		Gson gson = new Gson();
		String list = gson.toJson(filterDatas);
		System.out.println(list);
		return list;
	}
}