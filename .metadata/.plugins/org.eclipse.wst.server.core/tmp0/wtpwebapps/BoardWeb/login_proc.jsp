<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.springbook.biz.user.impl.UserDAO"%>
<%@ page import="com.springbook.biz.user.UserVO"%>

<%
// 1. 사용자 입력 정보 추출(검색 기능은 나중에 구현)
String id = request.getParameter("id");
String password = request.getParameter("password");

// 2. DB 연동 처리
UserVO vo = new UserVO();
vo.setId(id);
vo.setPassword(password);

UserDAO userDAO = new UserDAO();
UserVO user = new UserVO();

// 3. 화면 네비게이션
if (user != null) {
	response.sendRedirect("getBoardList.jsp");
} else {
	response.sendRedirect("login.jsp");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
</head>
<body>
	<center>
		<h1>글 목록</h1>
		<h3>
			테스트님 환영합니다 ... <a href="logout_proc.jsp"> Log-out </a>
		</h3>
		<!-- 검색 시작 -->
		<form action="getBoardList.jsp" method="post">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<td align="right"><select name="searchCondition">
							<option value="TITLE">제목
							<option value="CONTENT">내용
					</select> <input name="seatchKeyword" type="text" /> <input type="submit" value="검색"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>