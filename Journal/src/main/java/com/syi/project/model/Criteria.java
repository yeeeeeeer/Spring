package com.syi.project.model;

import java.util.Arrays;

public class Criteria {

	/* 현재 페이지 번호 */
	private int pageNum;

	/* 페이지 표시 개수 */
	private int amount;

	/* 검색 타입 */
	private String type;

	/* 검색 키워드 */
	private String keyword;

	/* 작가 리스트 */
	private String[] authorArr;

	/* 카테고리 코드 */
	private String cateCode;

	/* 상품 번호(댓글 기능에서 사용) */
	private int bookId;

	/* Criteria 생성자 */
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	/* Criteria 기본 생성자 */
	public Criteria() {
		this(1, 10);
	}

	/* 검색 타입 데이터 배열 변환 */
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String[] getAuthorArr() {
		return authorArr;
	}

	public void setAuthorArr(String[] authorArr) {
		this.authorArr = authorArr;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword=" + keyword
				+ ", authorArr=" + Arrays.toString(authorArr) + ", cateCode=" + cateCode + ", bookId=" + bookId + "]";
	}

}