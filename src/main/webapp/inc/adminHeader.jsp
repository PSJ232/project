<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
<script>
	$(document).ready(function() {
		//상대적인 좌표 값을 반환, .offset()가 반환 하는 객체는 left와 top 속성을 제공
		//top 속성을 이용해서 메뉴의 수직 위치를 구함
		var menu_offset = $('.main_menu').offset();
		//스크롤 바를 스크롤할 때 매개변수로 전달된 함수를 실행시킴
		$(window).scroll(function() {
			//문서의 스크롤바 위치와 메뉴의 수직 위치를 비교해서
			//문서의 스크롤바 위치가 메뉴의 수직 위치보다 크면(위치로 표현하면 아래)
			if ($(document).scrollTop() > menu_offset.top) {
				//메뉴에 menu-fixed 클래스를 추가해서 메뉴를 고정시킴
				$('.main_menu').addClass('menu_fixed');
			} else {
				//메뉴에서 menu-fized 클래스를 제거해서 메뉴를 수직으로 이동할 수 있도록 처리함
				$('.main_menu').removeClass('menu_fixed');
			}
		});
	});
</script>
<%
String m_id = (String) session.getAttribute("m_id");
String cookie_check = request.getHeader("Cookie");
if (cookie_check != null) {
	if (m_id == null) {
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
	if (cookie.getName().equals("m_id")) {
		m_id = cookie.getValue();
		session.setAttribute("m_id", m_id);
	}
		}
	}
}

String moveMypage = "";
if(m_id == null) {
	moveMypage = "MemberLogin.me";
} else {
	moveMypage = "MemberMypageDetail.me";
}
%>
</head>
<body>
	<header id="container">
		<div>
			<!--광고-->
		</div>
		<div class="nav_service_area">
			<%if (m_id == null) {%>
			<a class="nav_service_item" href="MemberLogin.me">로그인</a>
			<i class="nav_service_bar"></i>
			<a class="nav_service_item"	href="MemberJoin.me">회원가입<span class="color_blue fontweight_600">(1000포인트 지급!)</span></a>
			<i class="nav_service_bar"></i>
			<a class="nav_service_item fontweight_600">기업제휴</a>
			<%} else { if (m_id.equals("admin@admin.com")) {%>
				<a href="./admin_layout/main/main.jsp">관리자페이지</a>
				<i class="nav_service_bar"></i><%}%>
			<a class="nav_service_item"	href="MemberLogout.me">로그아웃</a>
			<i class="nav_service_bar"></i>
			<a class="nav_service_item fontweight_600">기업제휴</a>
			<%}%>
		</div>
		<div>

			<nav class="main_menu">
				<div class="nav_bar_logo">
					<a href="./"><img src="admin_layout/img/logo.png" alt=""
						class="logo_small"></a>
				</div>
				<ul class="nav_bar_list">
					<li class="item"><a href="#">꽃 정기구독</a></li>
					<li class="item"><a href="Flowers.shop">꽃다발</a></li>
					<li class="item"><a href="#">당일배송</a></li>
					<li class="item"><a href="#">플라워클래스</a></li>
					<li class="item"><a href="#">소품샵</a></li>
					<li class="item"><a href="#">이벤트</a></li>
				</ul>
				<div class="nav_bar_icon">
					<a href=<%=moveMypage %>><img
						src="admin_layout/img/profile.png" alt="go to mypage"
						class="nav_icon"></a> 
					<a href="Cart.cr"><img
						src="admin_layout/img/bag.png" alt="shopping cart"
						class="nav_icon"></a>
				</div>
			</nav>
		</div>
	</header>
</body>
</html>