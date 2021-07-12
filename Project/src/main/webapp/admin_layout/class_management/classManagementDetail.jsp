<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 상세페이지</title>
<style>
	.class_detail_container {
		display: flex;
		justify-content: space-around;
		width: 500px;
	}
	.timelist, .member_table {
		display: inline-block;
	}
	.timelist ul {
		list-style-type: none;
		padding: 0;
	}
	.member_table table{
		width: 300px;
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
	<h1>ClassDetail</h1>
	<div class="class_detail_container">
		<div class="timelist">
		<h3>TimeList</h3>
			<ul>
				<li>11:00 ~ 12:00</li>
				<li>13:00 ~ 14:00</li>
				<li>17:00 ~ 18:00</li>
			</ul>
		</div>
		<div class="member_table">
		<h3>MemberList</h3>
			<table border="1">
				<tr><th></th><th>이름</th><th>인원</th></tr>
				<tr><td><input type="radio"></td><td>홍길동</td><td>2명</td></tr>
			</table>
		</div>
	</div>
	<footer>
		<jsp:include page="../partial/footer.jsp"></jsp:include>
	</footer>
</body>
</html>