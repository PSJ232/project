<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
</head>
<%
String m_id = (String)session.getAttribute("m_id");

%>
<body>
	<h1>개인정보 수정</h1>
	<hr>
	<form action="MemberUpdatePro.me" method="post">
		<ul>
			<li><label>이메일(아이디)</label><input type="text" name="m_id" value="<%=m_id %>" readonly></li>
			<li><label>신규 비밀번호</label><input type="password" name="m_pass" value="새 비밀번호를 입력해주세요."></li>
			<li><label>이름</label><input type="text" name="m_name" required></li>
			<li><label>휴대폰 본인인증</label><input type="text" name="m_phone" required></li>
						<!-- 뷰페이지 참고 : 휴대폰번호 수정하면 본인인증 창이 나타남 -->
			<li><label>생년월일</label><input type="text" name="year" required><input type="text" name="month" required><input type="text" name="day" required></li>
			<li><label>성별</label><input type="radio" name="m_gender" value="0">남
									<input type="radio" name="m_gender" value="1">여</li>
		</ul>
		<hr>
		<h3>기념일 관리</h3>
		기념일을 등록하시면 5일전에 kukka가 문자로 알려드릴게요! <br>
		<table border="1">
			<tr>
				<td>D-348</td>
				<td>2021-06-21</td>
				<td>돌</td>
				<td>매년</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
		</table>
		<input type="button" value="기념일 등록하기">
		<hr>

		<input type="checkbox" name="m_agree">꾸까가 알려주는 꽃에 대한 정보와 다양한 소식을 받아보세요. <br>
		<input type="submit" value="수정하기"> <br>
	</form>
	<input type="button" value="회원 탈퇴" onclick="location.href='MemberDelete.me'">

</body>

</html>