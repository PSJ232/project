<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	ClassBean cb = (ClassBean) request.getAttribute("classDetail");
	String place = cb.getClass_place();
	String subject = cb.getClass_subject();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<img alt="" src=""><!-- 클래스 이미지 받아오기 -->
			<div><!-- 예약정보 입력 칸 -->
				<form action="/ReservInsert.ad" method="post">
					<div>
						<span>빛에 따른 색채 변화의 아름다움을 감상하며</span>
						<h2><%=cb.getClass_subject()%></h2>
						
						<h3>지점</h3>
						<ul id="classPlace">
							<li><a>"넌 할 수 있다 아작스야"</a></li>
						</ul>
						
<!-- 						<div> -->
<!-- 							<label>수강인원</label> -->
<!-- 							<select id="classReservNum"> -->
								
<!-- 							</select> -->
<!-- 						</div> -->
					</div>
<%-- 					<input type="hidden" name="f_id" id="a" value="<%=cb.getClass_id()%>"> --%>
<%-- 					<input type="hidden" name="fd_id" id="" value="<%=%>"> --%>
<%-- 					<input type="text" id="b" value="<%=subject%>"> --%>
					<input type="text" name="place" id="place" value="<%=cb.getClass_place()%>">
					<input type="text" name="subject" id="subject" value="<%=cb.getClass_subject()%>">
					<input type="text" name="r_num" id="r_num">
					<!-- 원래 fd_id말고 fd_date, fd_place, fd_time 세개 값을 가지고 fd_id 조회 -->
<!-- 					<input type="hidden" name="fd_id" value=""> -->
					<input type="submit" value="신청하기">
				</form>

			</div>
		</div>
	</div>
</body>
</html>