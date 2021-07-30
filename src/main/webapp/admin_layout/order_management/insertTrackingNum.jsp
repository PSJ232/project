<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운송장번호등록</title>
<script>
	var checkLengthResult = false;
	function checkLength(num){
		var regex = /^[0-9]{12}$/;
		var element = document.getElementById('check_result');
		if(regex.exec(num)) {
	        element.innerHTML = '사용 가능';
	        checkLengthResult = true; // 전역변수값을 true 로 변경
	     } else {
	        element.innerHTML = '사용 불가능';
	        checkLengthResult = false; // 전역변수값을 false 로 변경
	     }

	}
	function checkForm(){
		if(checkLengthResult){
			return true;
		}else{
			alert("올바른 운송장이 아닙니다!");
			return false;
		}
	}
</script>
</head>
<body>
<h1>운송장 등록</h1>
<form action="InsertTrackingNumPro.ad" method="post" onsubmit="return checkForm()">
	<input type="text" name="tracking_num" size="12" onkeyup="checkLength(this.value)">
	<input type="hidden" name="od_id" value="<%=request.getParameter("od_id") %>">
	<input type="submit" value="입력"><br>
	<span id="check_result"></span>
</form>
</body>
</html>