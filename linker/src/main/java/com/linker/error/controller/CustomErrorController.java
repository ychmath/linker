package com.linker.error.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError() {
        // 404 에러만 처리하고 나머지 에러는 기본 처리 방식으로 넘깁니다.
        HttpStatus status = HttpStatus.NOT_FOUND;
        if (status.value() == HttpStatus.NOT_FOUND.value()) {
            return "404";
        } else {
            return "error/error"; // 기본 에러 페이지
        }
    }
    
    public String getErrorPath() {
        return "/error";
    }
}