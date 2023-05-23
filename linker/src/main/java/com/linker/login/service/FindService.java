package com.linker.login.service;

import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.linker.login.dao.FindDao;
import com.linker.login.dto.LoginDto;

@Service
public class FindService {

	@Autowired
	FindDao dao;

	@Autowired
	private JavaMailSender mailSender;

	public boolean checkPassword(String userid, String currentPassword) {
		LoginDto user = dao.findByUserId(userid);
		return user != null && user.getPassword().equals(currentPassword);
	}

	public String findId(LoginDto dto) {
		String userid = dao.findId(dto);
		return userid;
	}

	public String findPassword(String userid, String email) {
		LoginDto user = dao.findByUsername(userid);
		if (user != null && email.equals(user.getEmail())) {
			String newPassword = generateTemporaryPassword();
			user.setPassword(newPassword);
			dao.updateUserPassword(user);
			sendTemporaryPasswordEmail(user);
			return newPassword;
		} else {
			return null;
		}
	}

	private String generateTemporaryPassword() {
		final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		SecureRandom random = new SecureRandom();
		StringBuilder password = new StringBuilder(8);

		for (int i = 0; i < 8; i++) {
			password.append(chars.charAt(random.nextInt(chars.length())));
		}

		return password.toString();
	}

	private void sendTemporaryPasswordEmail(LoginDto user) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("gonswor2@gmail.com");
		message.setTo(user.getEmail());
		message.setSubject("임시 비밀번호 발급");
		message.setText("임시 비밀번호: " + user.getPassword());
		mailSender.send(message);
	}
}
