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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function send(){
		window.opener.document.getElementById("class_date").value = document.getElementById("date").value;
		window.opener.document.getElementById("class_place").value = document.getElementById("date").value;
		window.close();
	}
	$(document).ready(function(){
		$('#seomyeon').click(function(){
			$.ajax('TimeList.ad', {
				data: {
					"place":$('#seomyeon').val(),
					date:$('#date').val()
				},
				success:function(rdata){
					$('p').append(rdata);
				}	// success
			});	//ajax
			$(this).unbind();
		});	//click
		$('#nampo').click(function(){
			$.ajax('TimeList.ad', {
				data: {
					"place":$('#nampo').val(),
					date:$('#date').val()
				},
				success:function(rdata){
					$('p').append(rdata);
				}	// success
			});	//ajax
			$(this).unbind();
		});	//click
		$('#haewoondae').click(function(){
			$.ajax('TimeList.ad', {
				data: {
					"place":$('#haewoondae').val(),
					date:$('#date').val()
				},
				success:function(rdata){
					$('p').append(rdata);
				}	// success
			});	//ajax
			$(this).unbind();
		});	//click
	})	// document.ready
// 	$(document).ready(function(){
// 		alert('click');
// 	});// ready
</script>
</head>
<body>
<form action="ClassDetailadd.ad" method="get">
날짜선택: <input type="date" name="date" id="date">
<h1>장소선택</h1>	<!-- onclick하면 ajax로 띄워주기 -->
<input type="button" name="place" id="seomyeon" value="서면" >
<input type="button" name="place" id="haewoondae" value="해운대" >
<input type="button" name="place" id="nampo" value="남포" >
<h3>시간선택</h3>
<p></p>
</form>
<input type="button" value="닫기" onclick="window.close()">
</body>
</html>