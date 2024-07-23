package com.vam.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	@Select("SELECT sysdate FROM dual")
	public String getTime(); // 인터페이스 방식
	
	public String getTime2(); // xml방식 사용해보려고 만든 메소드
	
}
