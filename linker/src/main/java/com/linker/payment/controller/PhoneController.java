package com.linker.payment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.linker.payment.dto.PhoneDto;
import com.linker.payment.service.PhoneService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PhoneController {

	@Autowired
	PhoneService service;

	@GetMapping("/phone") // 식권 사용 양식 페이지 이동
	public String useTicketForm(Model m) {
		List<PhoneDto> tickettypename = service.gettypename();
		m.addAttribute("tickettypename", tickettypename);
		return "payment/phoneform";
	}

	@PostMapping("/phone/use") // 식권 사용 내역을 검증 및 업데이트 하는 메서드
	@ResponseBody
	public boolean useTicketVerified(@RequestParam("tickettypename") int tickettypename,
			@RequestParam("quantity") Integer quantity, @RequestParam("phone") String phone) {
		boolean result = service.updateTicketUseByPhone(tickettypename, quantity, phone);
		return result;
	}

	@GetMapping("/phone/update")
	public String returnList(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		List<Integer> list = service.ticketidList();
		model.addAttribute("uid", userid);
		model.addAttribute("list", list);
		return "PhoneForm";
	}
	
}
