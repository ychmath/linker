package com.linker.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.linker.login.dao.FindpwDao;
import com.linker.login.dto.FindpwDto;
import com.linker.login.dto.MailDto;

import jakarta.mail.MessagingException;
@Service("findpswService")
public class FindpwService {
	@Autowired
	FindpwDao dao;
		
	public FindpwDto selectAll(String email, String userid) {
		
		
		FindpwDto dto = new FindpwDto();
		dto.setEmail(email);
		dto.setUserid(userid);
		
	   return	dao.selectAll(dto);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	// 메일 내용을 생성하고 임시 비밀번호로 회원 비밀번호를 변경 
    public MailDto createMailAndChangePassword(String email) {
        String str = getTempPassword();
        MailDto dto = new MailDto();
        dto.setAddress(email);
        dto.setTitle("Cocolo 임시비밀번호 안내 이메일 입니다.");
        dto.setMessage("안녕하세요. Cocolo 임시비밀번호 안내 관련 이메일 입니다." + " 회원님의 임시 비밀번호는 "
                + str + " 입니다." + "로그인 후에 비밀번호를 변경을 해주세요");
        updatePassword(str,email);
        return dto;
    }

    //임시 비밀번호로 업데이트
  
    public void updatePassword(String str, String email){
        String passowrd = str;
     //   Long userid = .findByMemberEmail(email).getId();
     //   mmr.updatePassword(userid,passowrd);
    }
    //랜덤함수로 임시비밀번호 구문 만들기
    public String getTempPassword(){
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        String str = "";

        // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }
    // 메일보내기
    

    //비밀번호 변경
    
   

}