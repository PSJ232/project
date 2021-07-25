<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String m_id = (String)session.getAttribute("m_id");
%>
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<body>
  <!-- header -->
  	<jsp:include page="inc/adminHeader.jsp" ></jsp:include>
  <!-- header -->
	(m_id) = <%=m_id %>
	<%if(m_id == null){%>
	<h3><a href="MemberJoin.me">회원가입</a></h3>
	<h3><a href="MemberLogin.me">로그인</a></h3>
	<h3><a href="Cart.cr">장바구니(비회원쿠키저장미구현)</a></h3>
	<%}else{%>
	<h3><a href="MemberLogout.me">로그아웃</a></h3>
	<h3><a href="MemberUpdate.me">회원정보수정</a></h3>
	<h3><a href="./mypage/mypage.jsp">마이페이지</a></h3>
	<h3><a href="OrderNow.od?i_id=1&c_qty=2&c_letter=1&c_delivery_date=2021-07-31">바로주문</a></h3>
	(바로주문 Test용 파라미터 = 제품번호:1, 수량:2, 편지있음, 배송요청일:2021-07-31)
	<h3><a href="Cart.cr">장바구니</a></h3>
	<%}%>
	
	
	
	
	<!-- footer -->
	<jsp:include page="inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>












