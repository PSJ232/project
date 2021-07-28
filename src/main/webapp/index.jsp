<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String m_id = (String)session.getAttribute("m_id");
String cookie_check = request.getHeader("Cookie");
if(cookie_check != null){
	if(m_id == null){
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("m_id")) {
				m_id = cookie.getValue();
				session.setAttribute("m_id", m_id);
			}
		}
	}
}
%>
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<body>
  <!-- header -->
  	<jsp:include page="inc/adminHeader.jsp" ></jsp:include>
  <!-- header -->
	<br>
	<hr>
	<br>
	<br>
	<h1><a href="./ItemDetail.it?i_id=1">상품1번내용(test)</a></h1>
	<br>
	<h1><a href="./ItemDetail.it?i_id=2">상품2번내용(test)</a></h1>
	<br>
	<h1><a href="./ItemDetail.it?i_id=3">상품3번내용(test)</a></h1>
	<br>
	<h1><a href="./ItemDetail.it?i_id=4">상품4번내용(test)</a></h1>
	<br>
	<br>
	<br>
	<hr>
	<br>
	
	
	
	
	<!-- footer -->
	<jsp:include page="inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>












