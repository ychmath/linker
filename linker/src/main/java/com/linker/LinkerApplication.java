package com.linker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
public class LinkerApplication {

	public static void main(String[] args) {
		SpringApplication.run(LinkerApplication.class, args);
	}
@Bean
	public HiddenHttpMethodFilter hiddenHttpMethodFilter() {
	return new HiddenHttpMethodFilter();
	//UnderBar형식 지원
}

	public HiddenHttpMethodFilter httpMethodFilter() {
		HiddenHttpMethodFilter hiddenHttpMethodFilter = new HiddenHttpMethodFilter();
		return hiddenHttpMethodFilter;
	}

}
