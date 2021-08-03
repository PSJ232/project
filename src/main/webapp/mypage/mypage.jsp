<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" >
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

</head>
<body>


	<!-- 헤더 들어가는곳 -->
	<header>
		<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	<!-- 헤더 들어가는곳 -->
	<hr>
	
	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>
	
	<!-- 본문 내용 -->
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


	<div class="mypage_main">
		<h3 id="mypage_main_subject">나의 주문내역</h3>
		<dl id="mypage_main_dl">
			<dt id="mypage_main_dt">Flower Subscriptions</dt>
			<dt id="mypage_main_dd_one">2주에 한번, 소중한 나를 위한 행복으로 채워보세요!</dd>
			<dt id="mypage_main_dd_two">꾸까 꽃 정기구독</dd>
			<dd id="mypage_main_dd_three">
				<input id="mypage_order_btn" type="button" value="보러가기">
			</dd>
		</dl>
	</div>

	<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>
	
	
	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->
</body>
</html>