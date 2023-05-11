package com.linker.finance.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.linker.finance.dto.ProfitDto;
import com.linker.finance.service.ProfitService;


@Controller
@RequestMapping("/finance")
public class FinanceController {
    @Autowired
    private ProfitService profitService;

    @GetMapping("/orders")
    public String getAllOrders(Model m) { //model - 뷰에 전달될 데이터  view - 화면을 만들 jsp
        
    	List<ProfitDto> list = profitService.getAllOrders();
    	System.out.println(list.size());
    	m.addAttribute("plist", list);
    	
    	return "finance/profit";
    }

    @GetMapping("/orders/{date}")
    public List<ProfitDto> getOrdersByDate(@PathVariable String date) {
        return profitService.getOrdersByDate(date);
    }

    @PostMapping("/orders")
    public int addOrder(@RequestBody ProfitDto dto) {
        return profitService.addOrder(dto);
    }

    @DeleteMapping("/orders/{orderId}")
    public int deleteOrderById(@PathVariable int orderId) {
        return profitService.deleteOrderById(orderId);
    }
    
    public String selectAll(ProfitDto profit) {
    	
    	return"";
    }
    @RequestMapping(value = "/filtered_data", method = RequestMethod.GET)
    public String fetchFilteredData(
        @RequestParam("start-date") @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate,
        @RequestParam("end-date") @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
        Model model) {

      List<ProfitDto> filteredData = profitService.selectByDate(startDate, endDate);
      model.addAttribute("plist", filteredData);
      return "finance/profit"; // JSP 페이지 파일명을 입력하십시오
    }
    
}
