<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	ClassBean cb = (ClassBean) request.getAttribute("cb");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 예약</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="./css/admin.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script>
	$(document).ready(function(){
        $.ajax('ReservClassPlace.ad', {
            type : 'GET',
            data: {
                'f_place': $('#place').val(),
                'f_subject': $('#subject').val()
             },
            success:function(rdata){
                $('#classPlace').append('<li><a>'+rdata+'</a></li>');
            }  
        }); 
        
        $.ajax('ReservClassTime.ad', {
            type : 'GET',
            data: { 'f_id': $('#f_id').val() },
            datatype: 'json',
            success:function(rdata){
				$.each(rdata, function(i, value){
					console.log("i: " + i + ", value: " + value);
	                 	$.ajax('ReservClassMem.ad', {
                		type: 'POST',
                		data: {
                			'fc_date': $('#date').val(),
                			'f_place': $('#place').val(),
                			'fd_time': value+":00:00",
                			'f_id': $('#f_id').val()
                		},
                		success:function(data){
                			$('#classReservNum').append('<option value='+value+':00:00>'+value+'시 | '+data+'명 가능</option>');
                		},
                		async: false
                	});   
				});
            },
            async: false
        }); 
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
	<div id="container"><!-- 전체 -->
		<div><!-- 예약 정보 입력 레이아웃-->
			<img alt="" src="<%=cb.getClass_main_img()%>">
			<img alt="" src="<%=cb.getClass_sub_img1()%>">
			<img alt="" src="<%=cb.getClass_sub_img2()%>">
			<img alt="" src="<%=cb.getClass_sub_img3()%>">
			<div><!-- 예약정보 입력 칸 -->
				<form action="ReservInsert.ad" method="post">
					<div>
						<span><%=cb.getClass_sub_desc()%></span>
						<h2><%=cb.getClass_subject()%></h2>
						
						<h3>지점</h3>
						<ul id="classPlace"></ul>
						
						<div>
							<label>수강 시간</label>
							<select name="fd_time" id="classReservNum">
								<option value="">시간을 선택하세요</option>
							</select>
						</div>
						<div>
							<label>수강 인원</label>
							<input type="number" name="r_num" id="r_num" min="0" required>
						</div>
					</div>
					<input type="hidden" name="fc_date" id="date" value="<%=cb.getClass_date()%>">
					<input type="hidden" name="fc_date" id="date" value="<%=cb.getClass_date()%>">
					<input type="hidden" name="fc_date" id="date" value="<%=cb.getClass_date()%>">
					<input type="hidden" name="f_id" id="f_id" value="<%=cb.getClass_id()%>">
					<input type="hidden" name="fd_place" id="place" value="<%=cb.getClass_place()%>">
					<input type="hidden" name="subject" id="subject" value="<%=cb.getClass_subject()%>">
					<input type="submit" value="신청하기">
				</form>
			</div>
		</div>
	</div>
</body>
</html>