package com.syi.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/journal")
public class JournalController {

	private static final Logger logger = LoggerFactory.getLogger(JournalController.class);

	/* 일지 등록 페이지 접속 */
	@RequestMapping(value = "journalEnroll", method = RequestMethod.GET)
	public String journalEnrollGET() throws Exception {
        logger.info("교육일지 등록 페이지 접속");
        return "journalEnroll"; // view 이름 반환
    }

}
