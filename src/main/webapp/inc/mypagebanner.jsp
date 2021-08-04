<%@page import="java.util.ArrayList"%>
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
	ArrayList<Integer> subscribeList = (ArrayList<Integer>) request.getAttribute("subscribeList");
	String m_id = (String) session.getAttribute("m_id");
	
	// 포인트 100 단위 , 표시 설정
	String point = String.format("%,d", memberMypageDetail.getM_point());

	// 등급 변환
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
	
	// 나의 정기구독 수 확인
	int subscribeCount;
	if(subscribeList != null) {
		subscribeCount = subscribeList.size();
	} else {
		subscribeCount = 0;
	}

	%>
	<!-- 본문 메인 상단 -->
	<div class="mypage_all">
		<div class="mypage_top">
			<div class="mypage_banner">

				<h4 id="mypage_user_name">
					<strong><%=memberMypageDetail.getM_name()%> 님,</strong><br> <span>오늘도 꽃같은 날이예요</span>
				</h4>

				<div class="mypage_top_right_c">
					<div id="mypage_top_right_i">
						<dl id="mypage_top_dl">
							<dt id="mypage_top_dt">등급정보</dt>
							<dd id="mypage_top_dd">
								<%=realGrade%><a href="MemberMypageGradeDetail.me" id="grade">
								</a>
							</dd>
						</dl>
						<dl id="mypage_top_dl">
							<dt id="mypage_top_dt">포인트</dt>
							<dd id="mypage_top_dd">
								<%=point %><a href="MemberMypagePointDetail.me" id="point">
								</a>
							</dd>
						</dl>
						<dl id="mypage_top_dl">
							<dt id="mypage_top_dt">나의구독</dt>
							<dd id="mypage_top_dd">
								<%=subscribeCount %> <a href="" id="myinfo"></a>
							</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>