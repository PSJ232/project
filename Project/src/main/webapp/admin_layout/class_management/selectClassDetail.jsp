<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script>
	function send(){
		window.opener.document.getElementById("start_time").value = document.getElementById("start_time").value;
		window.opener.document.getElementById("end_time").value = document.getElementById("end_time").value;
		var ele = document.getElementsByName('place');
		for(var i=0; i < ele.length; i++) { 
			if(ele[i].checked === true) { 
				window.opener.document.getElementById("class_place").value = ele[i].value;
				} 
			}
		window.close();
	}
</script>
</head>
<body>

<h3>시간선택</h3>
<label for="start_time">starttime </label>
<input type="text" id="start_time" name="start_time" class="form-control" style="width:200px;"><br>
<label for="end_time">endtime </label>
<input type="text" id="end_time" name="end_time" class="form-control" style="width:200px;">
<hr>
<h3>장소선택</h3>
<input type="radio" name="place" value="서면" checked>서면<br>
<input type="radio" name="place" value="해운대">해운대<br>
<input type="radio" name="place" value="남포">남포<br>
<input type="button" value="등록" onclick="send()">
<script>
$(function() {
    $("#start_time").timepicker({
        timeFormat: 'h:mm p',
        interval: 60,
        minTime: '10',
        maxTime: '7:00pm',
        defaultTime: '11',
        startTime: '10:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true        
    });
    
    $("#end_time").timepicker({
        timeFormat: 'h:mm p',
        interval: 60,
        minTime: '10',
        maxTime: '7:00pm',
        defaultTime: '11',
        startTime: '10:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true        
    });
});
</script>
</body>
</html>