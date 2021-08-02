<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String,Integer> qnaCount = (HashMap<String,Integer>)request.getAttribute("qnaCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 문의 목록</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/list_style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
	#qna_status {
		display: flex;
		justify-content: center;
		align-items: center;
		width: 770px;
		height: 70px;
		padding-left: 50px;
		padding-right: 50px;
	}
	
	#qna_status h2 {
		
		height: 50px;
		font-size: 25px;
		padding-top: 12px;
		align-items: center;
		margin-left: 50px;
	}
	.container fieldset {
		width: 800px;
		padding: 10px;
		border-radius: 10px;
		border: 2px solid #FFDF24;
	}
	.container legend {
		font-size: 20px;
		padding: 15px;
	}
	#qna_tab {
		margin-top: 10px;
		margin-bottom: 15px;
		font-size: 20px;
		width: 700px;
		
	}	
	#qna_tab li {
		display: inline-block;
		cursor: pointer;
		border: 1px solid #fff;
		border-radius: 10px;
		padding: 15px;
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
<script>
	$(function() {
		$('.admin_header_subtitle').text("문의 목록");
		// tab operation
		$('.tabmenu').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('.tabmenu').css('background-color', '#fff');
			$(this).css('background-color', '#FFDF24');
			$.ajax({
				type : 'GET',                 //get방식으로 통신
				url : "GetQnaList.ad",    //탭의 data-tab속성의 값으로 된 html파일로 통신
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
<!-- 	<header> -->
	<jsp:include page="/inc/adminHeader.jsp"></jsp:include>
<!-- 	</header> -->
<!-- 	<nav> -->
	<jsp:include page="/inc/navigation.jsp"></jsp:include>
<!-- 	</nav> -->
	<div class="container">
		<fieldset>
			<legend>문의 현황</legend>
			<div id="qna_status">
				<h2>미답변 <%=qnaCount.get("미답변") %></h2>
				<h2>답변완료 <%=qnaCount.get("답변완료") %></h2> 
			</div>
		</fieldset>
		<ul id="qna_tab">
			<li data-tab="tab1" class='tabmenu' id="default">미답변</li>
			<li data-tab="tab2" class='tabmenu'>답변완료</li>
		</ul>
		<div id="tabcontent"></div>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>