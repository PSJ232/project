<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<body>
	<header>
		<jsp:include page="../inc/adminHeader.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="../inc/navigation.jsp"></jsp:include>
	</nav>
	<div id="container"> <!-- css layout요소 추가 -->
		<h1>클래스 등록</h1>
		<form action="ClassInsertPro.ad" method="post" enctype="multipart/form-data" name="insert_form">
			<div class="class_insert_container">
				클래스 이름: <input type="text" name="class_subject" required><br>
				클래스 설명: <textarea name="class_desc" rows="30" cols="100"></textarea><br>
				비용: <input type="text" name="class_cost" required><br>
				정원: <input type="text" name="max_member" required><br>
				<input type="button" value="시간/장소선택" onclick="window.open('SelectClassDetail.ad','_blank', 'width=500,height=500 resizable=no')"><br>
				메인 이미지: <input type="file" name="class_main_img" required><br>
				서브 이미지1: <input type="file" name="class_sub_img1"><br>
				서브 이미지2: <input type="file" name="class_sub_img2"><br>
				서브 이미지3: <input type="file" name="class_sub_img3"><br>
				<input type="submit" value="등록">
			</div>
	<!-- 		<div class="buttons"> -->
	<!-- 		</div> -->
		</form>
	</div>
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>