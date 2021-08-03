<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/delete.css" type="text/css" />
</head>
<%
String m_id = (String)session.getAttribute("m_id");
%>
<body>
		<div class="hidden">세션ID = <%=m_id%></div>
		<hr size="1px" width=90% color="#878787">		
		<div class="title"><h3>회원 탈퇴 안내</h3></div>

	<div class="deleteForm">
		<form action="MemberDeletePro.me" id="formDelete" method="post">	
		<hr size="1px" width=90% color="#878787">		
			<div class="deleteNotice">
			<span title="highlightText">(고객이름) </span> 고객님, <br>
			탈퇴를 원하신다니 마음이 아프네요.<br>
			
			지금 탈퇴하시면 고객님의 (적립된포인트) 포인트는 자동 소멸됨을 알려드립니다.<br>
			</div>
		<hr size="1px" width=90% color="#878787">		
			<div class="title"><h3>회원탈퇴하기</h3></div>
		<hr size="1px" width=90% color="#878787">
			<div class="deleteCheck">
			<div class="label">비밀번호 확인(필수)</div> <input type="password" class="textBox" name="m_pass" required><br>

		<hr size="1px" width=90% color="#878787">
			<div class="label">kukka에 아쉬운점(선택)</div> <input type="text" class="contentTextBox">
			</div>

		<input type="button" value="취소">
		<input type="hidden" name="m_id" value="<%=m_id%>">
		<input type="submit" value="탈퇴">
		<hr size="1px" width=90% color="#878787">
		</form>
	</div>
</body>
</html>