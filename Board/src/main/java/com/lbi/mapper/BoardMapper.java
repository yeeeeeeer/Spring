package com.lbi.mapper;

import java.util.List;

import com.lbi.model.BoardVO;

public interface BoardMapper {
	
	/* 게시판 등록*/	
	public void enroll(BoardVO board);
	
	/* 게시판 목록 */
	public List<BoardVO> getList();
	
	/* 게시판 조회 */
	public BoardVO getPage(int bno);
	
	/* 게시판 수정 */
	public int modify(BoardVO baord);
}
