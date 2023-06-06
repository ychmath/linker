package com.linker.payment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.linker.payment.dao.QrSendDao;

@Service
public class QrSendService {

	@Autowired
	QrSendDao dao;
	
	@Autowired
	JavaMailSender mail;
	

}
