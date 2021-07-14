<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>우리모두 힘내욥!!</h1>
	<h3><a href="MemberJoin.me">회원가입</a></h3>
	<h3><a href="MemberLogin.me">로그인</a></h3>
	<h3><a href="MemberUpdate.me">회원정보수정</a></h3>
	<h3><a href="MemberLogout.me">로그아웃</a></h3>
<%
String m_id = (String)session.getAttribute("m_id");
String m_name = (String)session.getAttribute("m_name");

%>

로그인 아이디 = <%=m_id %>
	
</body>
</html>












