<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mypage.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

</head>
<body>

	<%
	// 	MemberBean memberMypageDetail = (MemberBean)request.getAttribute("memberMypageDetail"); 
	// 	String m_id = (String)session.getAttribute("m_id");

	// 	String realGrade = "";
	// 	switch(memberMypageDetail.getG_id()) {
	// 		case 3: realGrade = "BLACK"; break;
	// 		case 2: realGrade = "RED"; break;
	// 		case 1: realGrade = "GREEN"; break;
	// 		case 0: realGrade = "WHITE"; break;
	// 	}
	%>
	<!-- 헤더 들어가는곳 -->
	<header>
		<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	<!-- 헤더 들어가는곳 -->
	<hr>
	<!-- 본문들어가는 곳 -->
	<!-- 본문 메인 상단 -->

	<div class="mypage_all">
		<div class="mypage_top">
			<div class="mypage_banner">

				<h4 id="mypage_user_name">
					<strong>ooo 님,</strong><br> <span>오늘도 꽃같은 날이예요</span>
				</h4>

				<div class="mypage_top_right_c">
					<div id="mypage_top_right_i">
						<dl id="mypage_top_dl">
							<dt id="mypage_top_dt">등급정보</dt>
							<dd id="mypage_top_dd">
								white<a href="MemberMypageGradeDetail.me" id="grade"> </a>
							</dd>
						</dl>
						<dl id="mypage_top_dl">
							<dt id="mypage_top_dt">포인트</dt>
							<dd id="mypage_top_dd">
								0 <a href="MemberMypagePointDetail.me" id="point"> </a>
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



		<div class="mypage_center_c">
			<div id="mypage_center_i">
				<h4 id="mypage_center_subject">
					<span id="mypage_title_l">주문 / 배송 조회</span> <span
						id="mypage_title_r">(최근 1개월)</span>
				</h4>


				<div class="mypage_center_list">
					<dl id="mypage_center_dl">
						<dt id="mypage_center_dt">0</dt>
						<dd id="mypage_center_dd">
							결제대기 <a href=""> </a>
						</dd>
					</dl>
					<dl id="mypage_center_dl">
						<dt id="mypage_center_dt">0</dt>
						<dd id="mypage_center_dd">
							결제완료 <a href=""> </a>
						</dd>
					</dl>
					<dl id="mypage_center_dl">
						<dt id="mypage_center_dt">0</dt>
						<dd id="mypage_center_dd">
							상품준비중<a href=""></a>
						</dd>
					</dl>
					<dl id="mypage_center_dl">
						<dt id="mypage_center_dt">0</dt>
						<dd id="mypage_center_dd">
							발송완료<a href=""></a>
						</dd>
					</dl>
				</div>
			</div>
		</div>

		<!-- 본문 왼쪽 메뉴 -->
		<!-- 큰 메뉴 두 가지 한 번에 묶여 있음 -->

		<div class="mypage_main">
			<h3 id="mypage_main_subject">나의 주문내역</h3>
			<dl id="mypage_main_dl">
				<dt id="mypage_main_dt">Flower Subscriptions</dt>
				<dd id="mypage_main_dd_one">2주에 한번, 소중한 나를 위한 행복으로 채워보세요!</dd>
				<dd id="mypage_main_dd_two">꾸까 꽃 정기구독</dd>
				<dd id="mypage_main_dd_three">
					<input id="mypage_order_btn" type="button" value="보러가기">
				</dd>
			</dl>
		</div>



		<section class="mypage_left_section">
			<div id="mypage_left_menu">
				<h2 id="mypage_left_title">마이꾸까</h2>
				<ul id="mypage_menu_list">
					<li id="mypage_list"><a id="mypage_list_a"
						href="OrderMypageDetailList.od">주문내역/배송조회</a></li>
					<li id="mypage_list"><a id="mypage_list_a" href="MypageSubscribe.od">나의 정기구독</a></li>
					<li id="mypage_list"><a id="mypage_list_a" href="ClassMypageDetail.me">클래스
							수강내역</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="ReviewInsertForm.rv">상품 리뷰</a></li>
				</ul>
			</div>

			<div id="mypage_left_menu">
				<h2 id="mypage_left_title">개인정보 관리</h2>
				<ul id="mypage_menu_list">
					<li id="mypage_list"><a id="mypage_list_a"
						href="MemberUpdate.me">개인정보 수정</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="MemberMypageGradeDetail.me">회원등급</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="MemberMypagePointDetail.me">포인트</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="QnaInsert.qna">1:1 문의내역</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="MemberMypageFAQList.me">자주묻는질문</a></li>
				</ul>
			</div>
		</section>

	</div>




	<!-- 본문 내용 -->

	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->
</body>
</html>