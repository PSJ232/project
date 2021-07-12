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
</head>
<body>
	<header>
		<jsp:include page="../partial/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="../partial/nav.jsp"></jsp:include>
	</nav>
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
	<footer>
		<jsp:include page="../partial/footer.jsp"></jsp:include>
	</footer>
</body>
</html>