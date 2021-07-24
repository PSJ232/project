<%@page import="java.sql.Date"%>
<%@page import="vo.AnniversaryBean"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList<AnniversaryBean> annList = (ArrayList<AnniversaryBean>) request.getAttribute("annList");
	
	
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
			<%
			for (AnniversaryBean ab : annList) { // 반복문으로 기념일 정보를 하나씩 꺼내어 판별

				long newAnnDay = 0L; // 반복패턴에 따라 새 기념일을 저장할 변수선언
				String repeat = "없음"; // 반복패턴 판별하여 저장할 변수, 기본값 : 없음
				switch (ab.getA_repeat()) {
				case 1:
					repeat = "매년";
					break;
				case 100:
					repeat = "100일마다";
				}

				Date now = new Date(System.currentTimeMillis()); // 현재 날짜정보 저장
				Date annDay = Date.valueOf(ab.getA_date()); // 기념일 정보 저정

				if (now.getTime() > annDay.getTime()) { // 기념일이 지났는지 판별

					if (ab.getA_repeat() == 1) { // 매년 반복이면 그 다음해를 새 기념일로 해서 계산
						int yearPlus = now.getYear() - annDay.getYear(); // 해가 다르면 차이만큼 더해서 똑같은 연도로 맞춰서 계산한다
						if (now.getMonth() > annDay.getMonth()) {yearPlus += 1;} // 해가 같으나 월이 지났으면 한해를 더해서 계산한다
							else if (now.getMonth() == annDay.getMonth() && now.getDate() >= annDay.getDate()) {yearPlus += 1;} // 월이 같지만 일이 같거나 크면 한해를 더해서 계산한다
						annDay.setYear(annDay.getYear() + yearPlus); // 계산된 연도로 setYear해서 엎어써준다
						newAnnDay = annDay.getTime();
					} else if (ab.getA_repeat() == 100) { // 100일마다 반복이면
						long loop = Math.round(((now.getTime() - annDay.getTime()) / 24.0 / 60 / 60 / 1000 / 100)); // 100일을 몇번지났는지 계산하여 +1 한 숫자를 곱해준다
						newAnnDay = annDay.getTime() + ((100 * 24 * 60 * 60 * 1000L) * (loop + 1));
					} else { // 없음이면 그대로
						newAnnDay = annDay.getTime();
					}

				} else { // 기념일이 지나지 않았으면 그대로
					newAnnDay = annDay.getTime();
				}

				long dDay = Math.round(((now.getTime() - newAnnDay) / 24.0 / 60 / 60 / 1000));
			%>
			<tr>
				<td>D<%=dDay%></td>
				<td><%=ab.getA_date()%></td>
				<td><%=ab.getA_name()%></td>
				<td><%=repeat%></td>
				<td><a href="MemberAnnUpdateForm.me?a_id=<%=ab.getA_id()%>" onclick="window.open(this.href, 'anniversary', 'width=450, height=500'); return false;">수정</a></td>
				<td><a href="MemberAnnDeletePro.me?a_id=<%=ab.getA_id()%>">삭제</a></td>
			</tr>
			<%
			}
			%>
		</table>
		<input type="button" value="기념일 등록하기" onclick="window.open('MemberAnnForm.me', 'anniversary', 'width=450, height=500')">
		<hr>
		
		<input type="hidden" name="m_pass_origin" value="<%=memberDetail.getM_pass() %>">
		<input type="checkbox" name="m_agree" <%=check_agree %> >꾸까가 알려주는 꽃에 대한 정보와 다양한 소식을 받아보세요. <br>
		<input type="submit" value="수정하기"> <br>
	</form>
	<input type="button" value="회원 탈퇴" onclick="location.href='MemberDelete.me'">

</body>

</html>