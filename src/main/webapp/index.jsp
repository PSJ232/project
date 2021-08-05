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
    	$('.bxSlider').bxSlider({
    		controls: false,
   		 	pager: false,
   		 	speed: 1000
    	});
    	
    	$('.bxSlider2').bxSlider({
   		 	mode: 'horizontal',
   		 	controls: true,
   		 	speed: 1500,
   		    slideWidth: 400,   // 슬라이드 너비
   		    minSlides: 2,      // 최소 노출 개수
   		    maxSlides: 2,      // 최대 노출 개수
   		    slideMargin: 5,    // 슬라이드간의 간격
			pager: false,
			infiniteLoop: false,
			hideControlOnEnd: true
    	});
    });
</script>

<style>
#img{
	width: 330px;
	height: 340px;
}
.bx-wrapper {
  -moz-box-shadow: none;
  -webkit-box-shadow: none;
  box-shadow: none;
  border: 0;
}
</style>



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

<!--   <ul class="bxSlider2"> -->
<!--   		<li><a href="#"><img id="img" src="./admin_layout/upload/3_s_2.jpg"></a></li> -->
<!--   		<li><a href="#"><img id="img" src="./admin_layout/upload/3_m_2.jpg"></a></li> -->
<!--   		<li><a href="#"><img id="img" src="./admin_layout/upload/3_l_2.jpg"></a></li> -->
<!--   		<li><a href="#"><img id="img" src="./admin_layout/upload/3_xl_2.jpg"></a></li> -->
<!--   </ul> -->


<div class = "wrapper">
 <div class="bxSlider2">
 	<div>
 		<a href="#"><img id="img" src="./admin_layout/upload/3_s_2.jpg"></a>
 		꽃이 일상이 되는 가벼운 시작<br> 가벼운 S 꽃구독 <br> 1회 기준 17,900원~
 	</div>
 	<div><a href="#"><img id="img" src="./admin_layout/upload/3_m_2.jpg"></a></div>
 	<div><a href="#"><img id="img" src="./admin_layout/upload/3_l_2.jpg"></a></div>
 	<div><a href="#"><img id="img" src="./admin_layout/upload/3_xl_2.jpg"></a></div>
 </div>
 </div>
  


  

  
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












