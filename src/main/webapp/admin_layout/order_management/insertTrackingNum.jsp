<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운송장번호등록</title>
<link rel="stylesheet" href="./css/admin_tracking.css">
<script>
	var checkLengthResult = false;
	function checkLength(num){
		var regex = /^[0-9]{12}$/;
		var element = document.getElementById('check_result');
		if(regex.exec(num)) {
	        element.innerHTML = '올바른 운송장 입니다';
	        element.style.color = "#2F9D27";
	        checkLengthResult = true; // 전역변수값을 true 로 변경
	     } else {
	        element.innerHTML = '올바르지 않은 운송장 입니다';
	        element.style.color = "#DB0000";
	        checkLengthResult = false; // 전역변수값을 false 로 변경
	     }

	}
	function checkForm(){
		if(checkLengthResult){
//			opener.location.reload();
			return true;
		}else{
			alert("올바른 운송장이 아닙니다!");
			return false;
		}
	}
</script>
</head>
<body>
<form action="InsertTrackingNumPro.ad" method="post" onsubmit="return checkForm()" id="form">
	<h1 id="title">운송장 등록 / 수정</h1>
	<div id="container">
	<input type="text" id="tracking_num" name="tracking_num" size="12" onkeyup="checkLength(this.value)">
	<input type="hidden" name="od_id" value="<%=request.getParameter("od_id") %>">
	<input type="submit" class="btn" value="입력"><br>
	<span id="check_result"></span>
	</div>
</form>
</body>
</html>