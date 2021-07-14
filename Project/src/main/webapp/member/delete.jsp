<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String m_id = (String)session.getAttribute("m_id");
%>
<body>
<form action="MemberDeletePro.me" method="post">

세션ID = <%=m_id%><br>

(고객이름) 고객님,<br>
탈퇴를 원하신다니 마음이 아프네요.<br>

지금 탈퇴하시면 고객님의 (적립된포인트) 포인트는 자동 소멸됨을 알려드립니다.<br>

회원탈퇴하기<br>
<hr>
비밀번호 확인 <input type="password" name="m_pass" required><br>
(필수)<br>
<hr>
kukka에 아쉬운점 <input type="text"><br>
(선택)<br>

<input type="button" value="취소">
<input type="hidden" name="m_id" value="<%=m_id%>">
<input type="submit" value="탈퇴">
<hr>
</form>
</body>
</html>