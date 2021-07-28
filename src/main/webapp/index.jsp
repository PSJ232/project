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
	(m_id) = <%=m_id %>
	<%if(m_id==null){%>
	<h3><a href="VisitorCart.cr?i_id=2&c_qty=2&c_letter=1&c_delivery_date=2021-07-31">장바구니(비회원)</a></h3>
	(장바구니(비회원) Test용 파라미터 = 제품번호:1, 수량:2, 편지있음, 배송요청일:2021-07-31)
	<%}else{
		if(m_id.equals("admin")){%><h3><a href="./admin_layout/main/main.jsp">관리자페이지</a></h3><%}%>

	<%}%>
	<h3><a href="./ItemDetail.it?i_id=3">상품3번내용(test)</a></h3>
	
	
	
	
	<!-- footer -->
	<jsp:include page="inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>












