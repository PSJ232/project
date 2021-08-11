<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 클래스 등록</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/admin_class_insert_form.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script>
$.datepicker.setDefaults($.datepicker.regional['ko']);
$(document).ready(function(){
// 	$('#timeList').hide();
 	 // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
    // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가
  
    // 시작일
    $('.admin_header_subtitle').text("클래스 등록");
    $('#date').datepicker({
       dateFormat: "yy-mm-dd",
       changeMonth: true,
       maxDate: 21,
       minDate: 7,
       onClose: function(selectedDate){
          $('#date').datepicker('option', 'minDate', selectedDate);
          
          var date = $(this).datepicker('getDate');
          
          date.setDate(date.getDate() + 14);
          $('#date').datepicker("option", "maxDate", date);
       }
    });
    $('input[name="place"]').change(function(){
	   if($('#date').val() != ""){
//     	$('#timeList').show();
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
	   }else {
		   alert("날짜를 선택하세요!");
		   $('#date').focus();
	   }
  });   //change
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
	
	<form action="ClassInsertPro.ad" id="insert_form" method="post" enctype="multipart/form-data" name="insert_form">
		<div class="sub_container1">
			<h1 id="title">클래스 등록</h1>
			<label>클래스 명</label> <input type="text" name="class_subject" required><br>
			<label>클래스 요약설명</label> <input type="text" name="class_sub_desc" required><br>
			<label>날짜</label> <input type="text" id="date" name="date" readonly required><br>
			<label>장소</label>
			<input type="radio" name="place" class="radio" value="서면"> 서면  
			<input type="radio" name="place" class="radio" value="남포"> 남포 
			<input type="radio" name="place" class="radio" value="해운대"> 해운대  
			<br><br><label>시간</label>
			<select name="timeList" id="timeList" multiple="multiple"><option id="alrt">날짜와 장소 입력 후 선택 가능합니다.</option></select>
			<br><label>비용</label> <input type="text" id="cost" name="class_cost" required><br>
			<label>정원</label> <input type="text" name="max_member" required><br>
		</div>
		<div class="sub_container2">
			<label>썸네일 이미지</label> <input type="file" name="class_thumbnail_img" required><br>
			<label>메인 이미지</label> <input type="file" name="class_main_img" required><br>
			<label>서브 이미지1</label> <input type="file" name="class_sub_img1"><br>
			<label>서브 이미지2</label> <input type="file" name="class_sub_img2"><br>
			<label>서브 이미지3</label> <input type="file" name="class_sub_img3"><br>
			<label>설명 이미지</label> <input type="file" name="class_desc_img"><br>
			<fieldset><legend>클래스 설명</legend><textarea name="class_desc" rows="20" cols="65"></textarea></fieldset><br>
			<input type="submit" value="등록">
		</div>
	</form>
<!-- 	</div> -->
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>