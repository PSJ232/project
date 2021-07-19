<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#navi {
		width: 250px;
		height: 2000px;
		display: inline-block; 
		margin: 0;
		background-color: #ddd;
		float:left;
	}
	#navi ul li {
		display: block;
	}
	
</style>
</head>
<body>
<div id="navi">
	<ul >
		<li><a href="#">회원관리</a></li>
		<li><a href="#">리뷰관리</a></li>
		<li><a href="#">상품관리</a></li>
		<li><a href="#">매출관리</a></li>
		<li><a href="../order_management/orderMangementMain.jsp">주문관리</a></li>
		<li><a href="ClassList.ad">클래스관리</a></li>
		<li><a href="#">문의관리</a></li>
	</ul>

</div>
</body>
</html>