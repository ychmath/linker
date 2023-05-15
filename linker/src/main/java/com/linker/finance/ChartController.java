package com.linker.finance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class ChartController {
	@Autowired
	ChartService service;

	// view 경로 반환
	@GetMapping("/profitChart")
	public String viewChart() {
		return "chart/summary";
	}
	
	@RequestMapping("/getysResult")
	@ResponseBody
	public String getYearlySale(@ModelAttribute("targetYear")int targetYear, Model m) {
		m.addAttribute("targetYear", targetYear);
		
		List<ChartDto> list = service.yearlySale(targetYear);
		m.addAttribute("ysResult", list);

		Gson gson = new Gson();
		String ysResult = gson.toJson(list);

		return ysResult;
	}
	
	@RequestMapping("/getpResult")
	@ResponseBody
	public String getYearlyPurchase(@ModelAttribute("targetYear")int targetYear, Model m) {
		m.addAttribute("targetYear", targetYear);
		
		List<ChartDto> list = service.yearlyPurchase(targetYear);
		m.addAttribute("pResult", list);

		Gson gson = new Gson();
		String pResult = gson.toJson(list);

		return pResult;
	}
	
}
