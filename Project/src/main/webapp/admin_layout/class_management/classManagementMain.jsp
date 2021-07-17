<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스관리메인</title>
<style>
	#class_status li {
		display: inline-block;
		background-color: #ccc;
	}
	.class_content {
		background-color: #ccc;
		display: inline-block;
		
	}
	.class_content table{
		width: 700px;
		padding: 5px;
	}
	.select_place {
		float: right;
	}
</style>
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<header>
		<jsp:include page="../inc/adminHeader.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="../inc/navigation.jsp"></jsp:include>
	</nav>
	<div id="container"> <!-- css layout요소 추가 -->
		<div class="class_container">
			<h1>Class List</h1>
			<select class="select_place">
				<option>해운대</option>
				<option>서면</option>
				<option>남포</option>
			</select>
			<ul id="class_status">
				<li><a href="#">시작 전 클래스</a></li>43
				<li><a href="#">진행 중 클래스</a></li>
				<li><a href="#">완료된 클래스</a></li>
			</ul>
			<div class="class_content">
				<table>
					<tr><td rowspan="4"><input type="radio"></td><td rowspan="4">사진</td><td>클래스이름</td></tr>
					<tr><td>시간1</td><td>정원</td></tr>
					<tr><td>시간2</td><td>현재인원</td></tr>
					<tr><td>시간3</td><td>기간</td></tr>
				</table>
			</div>
		</div>
	
		<input type="button" value="등록">
		<input type="button" value="수정">
	</div>
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>