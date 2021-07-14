<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="../partial/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="../partial/nav.jsp"></jsp:include>
	</nav>
	<h1>클래스 등록</h1>
	<form action="ClassInsertPro.ad" method="post" enctype="multipart/form-data" name="insert_form">
		<div class="class_insert_container">
			클래스 이름: <input type="text" name="class_subject"><br>
			클래스 설명: <textarea name="class_desc" rows="30" cols="100"></textarea><br>
			비용: <input type="text" name="class_cost"><br>
			정원: <input type="text" name="max_member"><br>
			시간: <input type="text" name="class_time"> <input type="button" value="시간/장소선택" onclick="window.open('SelectClassDetail.ad','_blank', 'width=500,height=500')"><br>
<!-- 			장소: <input type="radio" name="class_place" value="해운대">해운대  -->
<!-- 			<input type="radio" name="class_place" value="서면">서면  -->
<!-- 			<input type="radio" name="class_place" value="남포">남포<br> -->
			메인 이미지: <input type="file" name="class_main_img"><br>
			서브 이미지1: <input type="file" name="class_sub_img1"><br>
			서브 이미지2: <input type="file" name="class_sub_img2"><br>
			서브 이미지3: <input type="file" name="class_sub_img3"><br>
			<input type="submit" value="등록">
		</div>
<!-- 		<div class="buttons"> -->
<!-- 		</div> -->
	</form>
	<footer>
		<jsp:include page="../partial/footer.jsp"></jsp:include>
	</footer>
</body>
</html>