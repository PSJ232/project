<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<%
MemberBean memberBean = (MemberBean) request.getAttribute("memberBean");
%>
</head>
<body>
  	<!-- header -->
  	<jsp:include page="../inc/header.jsp" ></jsp:include>
	<!-- header -->

	<%=memberBean.getM_name() %> 고객님,<br>
	탈퇴를 원하신다니 마음이 아프네요.<br>

	지금 탈퇴하시면 고객님의 <%=memberBean.getM_point() %> 포인트는 자동 소멸됨을 알려드립니다.<br>

	회원탈퇴하기<br>
	<hr>
	<form action="MemberDeletePro.me" method="post">
		비밀번호 확인 <input type="password" name="m_pass" required><br>
		(필수)<br>
		<hr>
		kukka에 아쉬운점 <input type="text"><br>
		(선택)<br>
		
		<input type="button" value="취소">
		<input type="hidden" name="m_id" value="<%=memberBean.getM_id() %>">
		<input type="submit" value="탈퇴">
	<hr>
	</form>
		
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>