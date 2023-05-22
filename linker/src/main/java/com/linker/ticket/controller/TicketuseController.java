package com.linker.ticket.controller;
  
  import java.util.List;
  
  import org.springframework.beans.factory.annotation.Autowired; import
  org.springframework.stereotype.Controller; import
  org.springframework.ui.Model; import
  org.springframework.web.bind.annotation.DeleteMapping; import
  org.springframework.web.bind.annotation.GetMapping; import
  org.springframework.web.bind.annotation.PathVariable; import
  org.springframework.web.bind.annotation.PostMapping; import
  org.springframework.web.bind.annotation.RequestBody; import
  org.springframework.web.bind.annotation.RequestMapping;
  
  import com.linker.ticket.dto.TicketorderDto; import
  com.linker.ticket.dto.TicketuseDto; import
  com.linker.ticket.service.TicketuseService;
  
  @Controller
  
  @RequestMapping("/ticketuse") public class TicketuseController {
  
  @Autowired private TicketuseService tuService;
  
  @GetMapping("/ticketu") public String getAllTicketuse(Model m) {
  
  List<TicketorderDto> list = tuService.getAllTicketuse();
  m.addAttribute("tulist",list);
  
  return "ticketuse/ticketu"; }
  
  @GetMapping("/ticketu/{date}") public List<TicketuseDto>
  getUseByDate(@PathVariable String date){ return
  TicketuseService.getUseByDate(date); }
  
  @PostMapping("/ticketu") public int addUse(@RequestBody TicketuseDto dto) {
  return TicketuseService.addUse(dto); }
  
  
  
  
  
  
  
  
  
  }
 