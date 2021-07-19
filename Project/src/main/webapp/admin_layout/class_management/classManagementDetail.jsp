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
<<<<<<< HEAD
</head> 
=======
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
>>>>>>> branch 'master' of https://github.com/PSJ232/project.git
<body>
	<header>
		<jsp:include page="../inc/adminHeader.jsp"></jsp:include>
	</header>
	<nav>
<<<<<<< HEAD
		<jsp:include page="../partial/navi.jsp"></jsp:include>
=======
		<jsp:include page="../inc/navigation.jsp"></jsp:include>
>>>>>>> branch 'master' of https://github.com/PSJ232/project.git
	</nav>
	<div id="container"> <!-- css layout요소 추가 -->
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
	</div>
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>