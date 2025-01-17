package com.lbi.model;

import java.util.Arrays;

public class Criteria {

	/* 검색 타입 */
	private String type;

	/* 검색 타입 배열 */
	private String[] typeArr;

	/* 현재 페이지 */
	private int pageNum;

	/* 한 페이지 당 보여질 게시물 갯수 */
	private int amount;

	/* 기본 생성자 -> 기본 세팅 : pageNum = 1, amount = 10 */
	public Criteria() {
		this(1, 10);
	}

	/* 생성자 -> 원하는 pageNum, 원하는 amount */
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
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
		this.typeArr = type.split("");
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}

	@Override
	public String toString() {
		return "Criteria [type=" + type + ", typeArr=" + Arrays.toString(typeArr) + ", pageNum=" + pageNum + ", amount="
				+ amount + "]";
	}

}
