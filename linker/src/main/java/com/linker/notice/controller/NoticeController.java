package com.linker.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.linker.login.dto.LoginDto;
import com.linker.notice.dto.NoticeDto;
import com.linker.notice.service.NoticeService;

@SessionAttributes("user")
@Controller
public class NoticeController{

	@Autowired
	NoticeService service;
	
	@ModelAttribute("user")
	public NoticeDto getDto() {
		return new NoticeDto();
	}
	
	@RequestMapping("/notice/notice")
	public String notice(@RequestParam(name="p", defaultValue="1")int page, Model m) {
		/* @RequestParam: HTTP 요청의 쿼리 파라미터(Query Parameter)값을 메소드의 매개변수에 바인딩하는 데 사용
		* defaultValue: 쿼리 파라미터가 생략된 경우 사용할 기본값을 지정함. 위의 예제에서는 'p'쿼리 파라미터가 생략되면 기본값으로 1이 할당됨
		* name="p": 쿼리 파라미터의 이름을 지정. 즉, 'p'라는 이름의 쿼리 파라미터 값을 가져옴
		*/
		
		int count = service.count();
			if(count > 0) {
				int perPage = 10; //한 페이지에 보일 글의 갯수
				int startRow = (page - 1) *  perPage;
				
				List<NoticeDto> noticeList = service.noticeList(startRow);
				m.addAttribute("nList", noticeList);
				//Model 객체에 nList라는 이름으로 추가
				//이렇게 추가된 속성은 JSP페이지에서 사용할 수 있음
				
				int pageNum = 5; //밑에 보여질 페이지 번호 갯수
				int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 
				//count / perPage: 아이템 수를 페이지 당 아이템 수로 나누면 전체 페이지 수를 구할 수 있음
				//count % perPage: 아이템 수를 페이지 당 아이템 수로 나눈 나머지를 구함. 이 값은 0 이상 perPage미만의 값을 가짐
				//count % perPage > 0 ? 1 : 0: 나머지 값이 0보다 크면 1을 더해주고 딱 떨어지면 0을 더해줌
				
				int begin = (page - 1) / pageNum * pageNum + 1; //페이지 그룹의 시작 페이지를 나타내는 변수
				//(page-1) / pageNum: 현재 페이지에서 1을 빼고, 페이지 그룹의 페이지 수로 나눈 몫을 계산함. 이를 통해 현재 페이지가 몇 번째 페이지 그룹에 위치하는지를 파악할 수 있음
				// * pageNum: 몫에 페이지 그룹의 페이지 수를 곱함. 이를 통해 페이지 그룹의 첫 번째 페이지 번호를 구함
				// + 1: 페이지 그룹의 첫 번째 페이지 번호에 1을 더하여 페이지 그룹의 시작 페이지를 계산함
				
				int end = begin + pageNum - 1;
				if(end > totalPages) {
					end = totalPages;
				}
				
				m.addAttribute("pageNum", pageNum);
				m.addAttribute("totalPages", totalPages);
				m.addAttribute("begin", begin);
				m.addAttribute("end", end);
			
			}// end가 0보다 크다면 위 code 실행 
				m.addAttribute("count", count);
				return "notice/notice";
	}//글이 하나도 없을 때 위 코드 실행

	
	@GetMapping("/notice/write")
	public String writeNotice() {
		return "notice/write";
	}
	
	@PostMapping("/notice/write")
	public String writenotice(NoticeDto dto) {
		service.insertNotice(dto);
		return "redirect:/notice/notice";
	}
	
	@GetMapping("/notice/content/{noticepostid}")
	public String content(@ModelAttribute("user") LoginDto userid, @PathVariable int noticepostid, Model m) {
		//"user"라는 이름으로 LoginDto 타입의 객체를 model에 추가함 -> jsp에서 해당 객체를 사용할 수 있게 해줌
		//@PathVariable int noticepostid: 경로 변수인 {noticepostid}의 값을 int 타입의 noticepostid 변수에 매핑함. 즉, URL에서 해당 위치의 값을 추출하여 noticepostid 변수에 할당
		NoticeDto dto = service.boardOne(noticepostid);
		m.addAttribute("dto", dto);
		return "notice/content";
	}
	
	@GetMapping("/notice/update/{noticepostid}")
	public String updateForm(@PathVariable int noticepostid, Model m) {
		NoticeDto dto = service.boardOne(noticepostid);
		m.addAttribute("dto", dto);
		return "notice/updateform";
	}
	
	@PutMapping("/notice/update")
	//@PutMapping: 클라이언트가 서버에게 업데이트할 데이터를 제공하고, 해당 데이터로 리소스를 생긴하거나 새로 만듦
	public String update(NoticeDto dto) {
		service.updateNotice(dto);
		return "redirect:/notice/notice";
	}
	
	@DeleteMapping("/notice/delete")
	@ResponseBody
	//@ResponseBody: 메소드의 반환 값을 직접 HTTP 응답의 본문으로 전송할 수 있음 -> 반환 값은 문자열로 전송됨
	public String deleteNotice(int noticepostid) {
		//메소드의 반환 타입이 String이기 때문에 데이터 타입은 String
		int delete = service.deleteNotice(noticepostid);
		return "" + delete; //@RequestMapping을 할 경우에는 무조건 하이퍼링크?를 들고가야하기 때문에 문자열을 추가
	}
	
	@GetMapping("/notice/search")
	public String search(int searchn, String search, @RequestParam(name="p", defaultValue="1")int page, Model m) {
		int count = service.countSearch(searchn, search);
		if(count > 0) {
			int perPage = 10; //한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;
			int endRow = page * perPage;
			
			List<NoticeDto> noticeList = service.noticeListSearch(searchn, search, startRow);
			m.addAttribute("nList", noticeList);
			
			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if(end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
			m.addAttribute("end", end);	
		}
			m.addAttribute("count", count);
			m.addAttribute("searchn", searchn);
			m.addAttribute("search", search);
			
			return "notice/search";
	}
	
	
	
}
