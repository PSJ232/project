<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="vo.MemberBean"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
</head>
<%
MemberBean memberDetail = (MemberBean) request.getAttribute("memberDetail");

String date[] = memberDetail.getM_birth().split("-"); // 날짜 "-"을 기준으로 분리해서 배열에 저장
String year = date[0];
String month = date[1];
String day = date[2];

String check_m = "";
String check_f = "";
String check_agree = "";
int m_gender = memberDetail.getM_gender();// 선택된 성별에 따라 체크표시
if (m_gender == 1) {
	check_f = "checked";
} else {
	check_m = "checked";
}

String m_agree = memberDetail.getM_agree();// 광고수신 동의 상태 표시
if (m_agree != null) {
	check_agree = "checked";
}
%>
<body>
	<h1>개인정보 수정</h1>
	<hr>
	<form action="MemberUpdatePro.me" method="post">
		<ul>
			<li><label>이메일(아이디)</label><input type="text" name="m_id" value="<%=memberDetail.getM_id() %>" readonly></li>
			<li><label>신규 비밀번호</label><input type="password" name="m_pass" placeholder="새 비밀번호를 입력해주세요."></li>
	 		<li><label>이름</label><input type="text" name="m_name" value="<%=memberDetail.getM_name() %>" required></li>
			<li><label>휴대폰 본인인증</label><input type="text" name="m_phone" value="<%=memberDetail.getM_phone() %>" required></li>
						<!-- 뷰페이지 참고 : 휴대폰번호 수정하면 본인인증 창이 나타남 -->
			<li><label>생년월일</label><input type="text" name="year" value="<%=year %>" required><input type="text" name="month" value="<%=month %>" required><input type="text" name="day" value="<%=day %>" required></li>
			<li><label>성별</label><input type="radio" name="m_gender" value="0" <%=check_m%>>남
									<input type="radio" name="m_gender" value="1" <%=check_f%>>여</li>
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
		
		<input type="hidden" name="m_pass_origin" value="<%=memberDetail.getM_pass() %>">
		<input type="checkbox" name="m_agree" <%=check_agree %> >꾸까가 알려주는 꽃에 대한 정보와 다양한 소식을 받아보세요. <br>
		<input type="submit" value="수정하기"> <br>
	</form>
	<input type="button" value="회원 탈퇴" onclick="location.href='MemberDelete.me'">

</body>

</html>