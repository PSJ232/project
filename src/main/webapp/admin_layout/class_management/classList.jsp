<%@page import="vo.ClassDetailBean"%>
<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 클래스 목록</title>
<!-- <link rel="stylesheet" href="./css/list_style.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/admin_class_list.css">
<script>
	$(function() {
		$('.admin_header_subtitle').text("클래스 목록");
		// tab operation
		$('.tabmenu').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('.tabmenu').css('background-color', '#fff');
			$(this).css('background-color', '#FFDF24');
			$.ajax({
				type : 'GET',                 //get방식으로 통신
				url : "GetClassList.ad",    //탭의 data-tab속성의 값으로 된 html파일로 통신
				data : {
					'activeTab': activeTab
				},
				error : function() {          //통신 실패시
					alert('통신실패!');
				},
				success : function(data) {    //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
					console.log(data);
					$('#tabcontent').html(data);
				}
			});
		});
		$('#default').click();          
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/inc/adminHeader.jsp" ></jsp:include>
	<!-- header -->
	
	<!-- nav -->
	<jsp:include page="/inc/navigation.jsp" ></jsp:include>
	<!-- nav -->
	<div class="class_list_container">
<!-- 	<h1 id="class_list_title">Class List</h1> -->
	<ul id="class_status">
		<li data-tab="tab1" class='tabmenu' id="default">시작 전 클래스</li>
		<li data-tab="tab2" class='tabmenu'>완료된 클래스</li>
	</ul>

	<div id="tabcontent"></div>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>