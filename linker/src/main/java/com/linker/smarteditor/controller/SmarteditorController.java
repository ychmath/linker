package com.linker.smarteditor.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.linker.smarteditor.vo.SmarteditorVO;

import jakarta.servlet.http.HttpServletRequest;

@RequestMapping(value="/singleImageUploader.do")
public class SmarteditorController(HttpServletRequest request, HttpServletResponse response){
	try {
		//파일정보
		String sFileInfo = "";
		//파일명을 받는다 - 일반 원본파일명
		String sFilename = request.getHeader("file-name");
		//파일 확장자
		String sFilenameExt = sFilename.substring(sFilename.lastIndexOf(".")+1);
		//확장자를소문자로 변경
		sFilenameExt = sFilenameExt.toLowerCase();
			
		//이미지 검증 배열변수
		String[] allowFileArr = {"jpg","png","bmp","gif"};

		//확장자 체크
		int nCnt = 0;
		for(int i=0; i<allowFileArr.length; i++) {
			if(sFilenameExt.equals(allowFileArr[i])){
				nCnt++;
			}
		}

		//이미지가 아니라면
		if(nCnt == 0) {
			PrintWriter print = response.getWriter();
			print.print("NOTALLOW_"+sFilename);
			print.flush();
			print.close();
		} else {
			//디렉토리 설정 및 업로드	
			
			//파일경로
			String filePath = "경로설정";
			File file = new File(filePath);
			
			if(!file.exists()) {
				file.mkdirs();
			}
			
			String sRealFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today= formatter.format(new java.util.Date());
			sRealFileNm = today+UUID.randomUUID().toString() + sFilename.substring(sFilename.lastIndexOf("."));
			String rlFileNm = filePath + sRealFileNm;
			
			///////////////// 서버에 파일쓰기 ///////////////// 
			InputStream inputStream = request.getInputStream();
			OutputStream outputStream=new FileOutputStream(rlFileNm);
			int numRead;
			byte bytes[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while((numRead = inputStream.read(bytes,0,bytes.length)) != -1){
				outputStream.write(bytes,0,numRead);
			}
			if(inputStream != null) {
				inputStream.close();
			}
			outputStream.flush();
			outputStream.close();
			
			///////////////// 이미지 /////////////////
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName="+ sFilename;
			sFileInfo += "&sFileURL="+"경로설정"+sRealFileNm;
			PrintWriter printWriter = response.getWriter();
			printWriter.print(sFileInfo);
			printWriter.flush();
			printWriter.close();
		}	
	} catch (Exception e) {
		e.printStackTrace();
	}
}