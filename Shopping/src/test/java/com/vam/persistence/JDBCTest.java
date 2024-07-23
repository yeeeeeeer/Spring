package com.vam.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTest {
	static { // static: 자동으로 메모리에 올라가면서 라이브러리를 올려줌
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try (Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe",
				"spring",
				"1234")){
			System.out.println(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
