package com.lib.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lbi.model.BoardVO;
import com.lbi.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTest {

	private static final Logger log = LoggerFactory.getLogger(BoardServiceTest.class);

	@Autowired
	private BoardService service;

	/*
	 * @Test public void testEnroll() {
	 * 
	 * BoardVO vo = new BoardVO();
	 * 
	 * vo.setTitle("service test"); vo.setContent("service test");
	 * vo.setWriter("service test");
	 * 
	 * service.enroll(vo); }
	 */

	/* 게시판 목록 테스트 */

	public void testGetList() {
		service.getList().forEach(board -> log.info("" + board));
	}

	/* 게시판 조회 */

	public void setGETPage() {

		int bno = 41;

		log.info("" + service.getPage(bno));
	}

	/* 게시판 수정 */
	public void testModify() {

		BoardVO board = new BoardVO();
		board.setBno(41);
		board.setTitle("수정 제목");
		board.setContent("수정 내용");

		int result = service.modify(board);
		log.info("result : " + result);
	}

	/* 게시판 삭제 */
	@Test
	public void testDelete() {
		int result = service.delete(42);
		log.info("result: " + result);
	}
}
