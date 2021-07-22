<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="MemberLoginPro.me" method="post">
		<input type="text" name="m_id" placeholder="아이디(이메일)"><br>
		<input type="password" name="m_pass" placeholder="비밀번호"><br>
		<input type="checkbox">로그인 상태 유지<br> <!-- 기능구현방법 공부필요!! -->
		<input type="submit" value="로그인"><br>
		<a href="MemberFindId.me">아이디찾기</a> <a href="#">비밀번호 찾기</a><br>
		<hr>
		SNS계정으로 간편 로그인<br>
		<a href="#">페이스북</a> <a href="#">네이버</a> <a href="#">카카오톡</a><br>
		<input type="button" value="회원가입" onclick="location.href='MemberJoin.me'"><br>
	</form>
	지금 회원가입 하시면 1,000p 바로 지급!<br>
	비회원 주문 조회
	</body>
</html>