<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
	String m_id = (String) session.getAttribute("m_id");
	int od_id = Integer.parseInt(request.getParameter("od_id"));

	String realGrade = "";
	switch (memberMypageDetail.getG_id()) {
	case 3:
		realGrade = "BLACK";
		break;
	case 2:
		realGrade = "RED";
		break;
	case 1:
		realGrade = "GREEN";
		break;
	case 0:
		realGrade = "WHITE";
		break;
	}

	// 아이디 설정
	String mId[] = m_id.split("@");
	String a = mId[0].substring(0, 4);
	String editId = a + "***";
	%>
	<!-- 본문 메인 상단 -->
	<div class="mypage_all">
		<div class="mypage_top">
			<div class="mypage_banner">

				<h4 id="mypage_user_name">
					<strong><%=m_id%> 님,</strong><br> <span>오늘도 꽃같은 날이예요</span>
				</h4>

				<div class="mypage_top_right_c">
					<div id="mypage_top_right_i">
						<dl id="mypage_top_dl">
							<dt id="mypage_top_dt">등급정보</dt>
							<dd id="mypage_top_dd">
								white<a href="MemberMypageGradeDetail.me" id="grade"><%=realGrade%>
								</a>
							</dd>
						</dl>
						<dl id="mypage_top_dl">
							<dt id="mypage_top_dt">포인트</dt>
							<dd id="mypage_top_dd">
								0 <a href="MemberMypagePointDetail.me" id="point"><%=memberMypageDetail.getM_point()%>
								</a>
							</dd>
						</dl>
						<dl id="mypage_top_dl">
							<dt id="mypage_top_dt">나의구독</dt>
							<dd id="mypage_top_dd">
								2 <a href="" id="myinfo"></a>
							</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>