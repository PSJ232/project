<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리메인</title>
<style>
	.order_container #order_status li{
		display: inline-block;
		background-color: #ccc;
	}
	.order_container #order_list {
		width: 800px;
	}
</style>
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<div class="order_container">
		<h1>Order List</h1>
		<ul id="order_status">
			<li><a href="#">결제완료</a></li>
			<li><a href="#">배송중</a></li>
			<li><a href="#">배송완료</a></li>
		</ul>
		<table id="order_list" border="1">
			<tr><th>ID</th><th>Name</th><th>Product</th><th>Status</th></tr>
			<tr><td>1@naver.com</td><td>admin</td><td>flower</td><td>배송중</td></tr>
			<tr><td>1@naver.com</td><td>admin</td><td>flower</td><td>배송중</td></tr>
			<tr><td>1@naver.com</td><td>admin</td><td>flower</td><td>배송중</td></tr>
			<tr><td>1@naver.com</td><td>admin</td><td>flower</td><td>배송중</td></tr>
		</table>
   	<!-- header -->
   	<jsp:include page="../inc/adminHeader.jsp" ></jsp:include>
   	<!-- header -->
      	
    <!-- nav -->
	<jsp:include page="../inc/navigation.jsp" ></jsp:include>
	<!-- nav -->

	<div><!-- css layout요소 추가 -->
		<div class="order_container">
			<h1>Order List</h1>
			<ul id="order_status">
				<li><a href="#">결제완료</a></li>
				<li><a href="#">배송중</a></li>
				<li><a href="#">배송완료</a></li>
			</ul>
			<table id="order_list" border="1">
				<tr><th>ID</th><th>Name</th><th>Product</th><th>Status</th></tr>
				<tr><td>1@naver.com</td><td>admin</td><td>flower</td><td>배송중</td></tr>
				<tr><td>1@naver.com</td><td>admin</td><td>flower</td><td>배송중</td></tr>
				<tr><td>1@naver.com</td><td>admin</td><td>flower</td><td>배송중</td></tr>
				<tr><td>1@naver.com</td><td>admin</td><td>flower</td><td>배송중</td></tr>
			</table>
		</div>
	</div>
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>