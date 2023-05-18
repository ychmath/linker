package com.linker.login.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.linker.login.dto.FindpwDto;
import com.linker.login.dto.MailDto;
import com.linker.login.service.FindpwService;

@Controller
public class FindpwController {
	@Autowired
	private FindpwService service;
	
    @Transactional
    
    
    @GetMapping("/findpwform")
    public String findpwform() {
    	return "/Login/findpw";
    }
    
    
	/*
	 * @PostMapping("/sendEmail") public String
	 * sendEmail(@RequestParam("memberEmail") String memberEmail){ MailDto dto =
	 * service.createMailAndChangePassword(memberEmail); service.mailSend(dto);
	 * 
	 * return "/member/login"; }
	 */
	
}
