<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		text-align: center;
	}
</style>
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#place').on('change',function(){
// 			$("#셀렉트ID option").index($("#셀렉트ID option:selected"));
			
			if($('#place option:selected').index() != 0){
				$.ajax('TimeList.ad', {
					type: "GET",
					data: {
						"place":$('#place option:selected').val(),
						date:$('#date').val()
					},
					success:function(rdata){
						$('p').empty();
						$('p').append(rdata);
					},	// success
				});	//ajax
			}
		});	//click
	})	// document.ready
</script>
</head>
<body>
<form action="ClassDetailadd.ad" method="get">
날짜선택: <input type="date" name="date" id="date">
<h1>장소선택</h1>	<!-- onclick하면 ajax로 띄워주기 -->
<select id="place">
	<option>장소를 선택하세요</option>
	<option>서면</option>
	<option>남포</option>
	<option>해운대</option>
</select>
<h3>시간선택</h3>
<p></p>
</form>
</html>