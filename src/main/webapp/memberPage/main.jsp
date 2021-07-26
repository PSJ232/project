<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String m_id = (String)session.getAttribute("m_id");
// int i_id = Integer.parseInt(request.getParameter("i_id"));
%>
<link rel="stylesheet" href="../css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<body>
  <!-- header -->
  	<jsp:include page="../inc/adminHeader.jsp" ></jsp:include>
  <!-- header -->
  
  
  	<h3><a href="../ItemDetail.it?i_id=3">아이템 디테일</a></h3>
  
  
  
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>












