package com.vam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// 홈페이지 기본적인 기능들 (메인페이지 이동, 상품검색 등)의 요청을 관리
@Controller
public class ShoppingController {

	private static final Logger logger = LoggerFactory.getLogger(ShoppingController.class);

	// 메인 페이지 이동
	@GetMapping("/main")
	public void mainPageGET() {
		
		logger.info("메인 페이지 진입");
		
	}

}
