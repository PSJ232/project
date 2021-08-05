<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/style.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  

<script>
    $(document).ready(function(){
    	$('.bxSlider').bxSlider();
    });
</script>



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

  
</head>
<body>

  <!-- header -->
  	<jsp:include page="inc/header.jsp" ></jsp:include>
  <!-- header -->
  

  
	<ul class="bxSlider">
		<li><a href="#"><img src="./img/main/main_banner_1.jpg"></a></li>	
		<li><a href="#"><img src="./img/main/main_banner_2.png"></a></li>	
		<li><a href="#"><img src="./img/main/main_banner_3.png"></a></li>	
		<li><a href="#"><img src="./img/main/main_banner_4.png"></a></li>	
		<li><a href="#"><img src="./img/main/main_banner_5.png"></a></li>	
		<li><a href="#"><img src="./img/main/main_banner_6.png"></a></li>	
	</ul>
  
  

  


  

  
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<hr> -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<h1>메인화면을 꾸며주세요 -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<hr> -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<br> -->
	
	
	
	<!-- footer -->
	<jsp:include page="inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>












