<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 클래스 등록</title>
<style>
	body {
		text-align: center;
	}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script>
$(function(){
	
  $.datepicker.setDefaults($.datepicker.regional['ko']);
  // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
    // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가
  
    // 시작일
    
    $('#date').datepicker({
       dateFormat: "yy-mm-dd",
       changeMonth: true,
       maxDate: 21,
       minDate: 7,
       onClose: function(selectedDate){
          $('toDate').datepicker('option', 'minDate', selectedDate);
          
          var date = $(this).datepicker('getDate');
          
          date.setDate(date.getDate() + 14);
          $('#toDate').datepicker("option", "maxDate", date);
       }
    });
   // $('input:checkbox[input[name="radio"]').is(':checked')
    $('input[name="place"]').change(function(){
        $.ajax('TimeList.ad', {
           type: "GET",
           data: {
              "place":$('input[name=place]:checked').val(),
              date:$('#date').val()
           },
           success:function(rdata){
              $('#timeList').empty();
              $('#timeList').append(rdata);
           }   // success
        });   //ajax
        
  });   //change
});
</script>
</head>
<body>

   <!-- onclick하면 ajax로 띄워주기 -->
<div id="container"> <!-- css layout요소 추가 -->
		<h1>클래스 등록</h1>
		<form action="ClassInsertPro.ad" method="post" enctype="multipart/form-data" name="insert_form">
			<div class="class_insert_container">
				클래스 이름: <input type="text" name="class_subject" required><br>
				날짜선택: <input type="text" id="date" name="date"><br>
				<h1>장소선택</h1>
				<input type="radio" name="place" value="서면">서면 
				<input type="radio" name="place" value="남포">남포 
				<input type="radio" name="place" value="해운대">해운대 
				<h3>시간선택</h3>
				<select name="timeList" id="timeList" multiple="multiple"></select><br>
				클래스 설명: <textarea name="class_desc" rows="30" cols="100"></textarea><br>
				비용: <input type="text" name="class_cost" required><br>
				정원: <input type="text" name="max_member" required><br>
				메인 이미지: <input type="file" name="class_main_img" required><br>
				서브 이미지1: <input type="file" name="class_sub_img1"><br>
				서브 이미지2: <input type="file" name="class_sub_img2"><br>
				서브 이미지3: <input type="file" name="class_sub_img3"><br>
				<input type="submit" value="등록">
			</div>
		</form>
	</div>


</html>