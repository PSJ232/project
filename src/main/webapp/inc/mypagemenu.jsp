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

		<!-- 본문 왼쪽 메뉴 -->
		<section class="mypage_left_section">
			<div id="mypage_left_menu">
				<h2 id="mypage_left_title">마이꾸까</h2>
				<ul id="mypage_menu_list">
					<li id="mypage_list"><a id="mypage_list_a"
						href="OrderMypageDetailList.od">주문내역/배송조회</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="MypageSubscribe.od">나의 정기구독</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="ClassMypageDetail.me">클래스 수강내역</a></li>
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
					<li id="mypage_list"><a id="mypage_list_a" href="QnaList.qna">1:1
							문의내역</a></li>
					<li id="mypage_list"><a id="mypage_list_a"
						href="MemberMypageFAQList.me">자주묻는질문</a></li>
				</ul>
			</div>
		</section>



</body>
</html>