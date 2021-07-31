<%@page import="vo.ClassDetailBean"%>
<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100&display=swap" rel="stylesheet">
<style>
/* 	#class_list_title { */
/* 		margin-bottom: 10px; */
/* 		width: 700px; */
/* 		display: inline-block; */
/* 		padding-bottom: 10px; */
/* 		font-family: 'Hahmlet', serif; */
/* 		font-size: 60px; */
/* 		color: #ccc; */
/* 	} */
	.class_list_container {
		margin-left: 400px;
		margin-top: 100px;
	}
	#class_status {
		margin-top: 10px;
		margin-bottom: 15px;
		font-size: 20px;
		width: 700px;
		
	}	
	#class_status li {
		display: inline-block;
		cursor: pointer;
		border: 1px solid #fff;
		border-radius: 10px;
		padding: 15px;
		font-family: 'Gowun Dodum', sans-serif;
	}

</style>
<link rel="stylesheet" href="./css/admin.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script>
	$(function() {
		$('.admin_header_subtitle').text("클래스 리스트");
		// tab operation
		$('.tabmenu').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('li').css('background-color', '#fff');
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