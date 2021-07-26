<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="member/css/login.css" rel="stylesheet" >
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>

	<header>
		<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	
	
	<h1>로그인</h1>
	<form action="MemberLoginPro.me" method="post">
		<input type="text" name="m_id" id="inp" placeholder="아이디(이메일)"><br>
		<input type="password" name="m_pass" id="inp" placeholder="비밀번호"><br>
		<input type="checkbox" name="autoLogin" id="checklogin">로그인 상태 유지<br>
		<input type="submit" value="로그인" class="loginbutton"><br>
		<a id="fin" href="MemberFindId.me">아이디 찾기</a> 
		<a id="fin" href="findPass.jsp">비밀번호 찾기</a><br>
		<hr>
		<p id="sns">SNS계정으로 간편 로그인</p> <br> 
		<a href="https://kukka.kr/account/social-login/facebook/"> <img src="member/img/facebook.png"></a>
		<a href="https://kukka.kr/account/social-login/naver/"> <img src="member/img/naver.png"></a> 
		<a href="https://kukka.kr/account/social-login/kakao/"> <img src="member/img/kakao.png"></a><br>
		<input type="button" value="회원가입" class="joinbutton" onclick="location.href='MemberJoin.me'"><br>
	</form>
	<p id="now">
		지금 회원가입 하시면 <span id="p1">1,000p</span> 바로 지급!
	</p>
	<br>
	<p id="nonmember">비회원 주문 조회</p>

	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>