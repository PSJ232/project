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
<link href="css/style.css" rel="stylesheet">
<link href="css/classReserv.css" rel="stylesheet" >
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script>
	$(document).ready(function(){
        $.ajax('ReservClassPlace.od', {
            type : 'GET',
            data: {
                'f_place': $('#place').val(),
                'f_subject': $('#subject').val()
             },
            success:function(rdata){
                $('#classPlace').append('<li><a>'+rdata+'</a></li>');
            }
        }); 
        
        $.ajax('ReservClassTime.od', {
            type : 'GET',
            data: { 'f_id': $('#f_id').val() },
            datatype: 'json',
            success:function(rdata){
				$.each(rdata, function(i, value){
					console.log("i: " + i + ", value: " + value);
	                 	$.ajax('ReservClassMem.od', {
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
	<jsp:include page="/inc/header.jsp" ></jsp:include>
	<!-- header -->
	
	<div id="container"><!-- 전체 -->
		<div><!-- 예약 정보 입력 레이아웃-->
			<div class="category_product_image shop_class_layout_top">
				<div class="shop_class_mainImg thumnail_main">
					<img src="img_upload/<%=cb.getClass_main_img()%>">		
				</div>
				<div class="shop_class_subImg_box">
					<div class="change_img active shop_class_subImg">
						<img src="img_upload/<%=cb.getClass_main_img()%>">
					</div>
					<div class="change_img shop_class_subImg">
						<img src="img_upload/<%=cb.getClass_sub_img1()%>">
					</div>
					<div class="change_img shop_class_subImg">
						<img src="img_upload/<%=cb.getClass_sub_img2()%>">
					</div>
					<div class="change_img shop_class_subImg">
						<img src="img_upload/<%=cb.getClass_sub_img3()%>">
					</div>
				</div>
			</div>
			<div class="shop_class_layout_bottom"><!-- 예약정보 입력 칸 -->
				<form action="ReservInsert.od" method="post">
					<div>
						<div class="shop_class_infobox1">
							<p class="shop_class_desc"><%=cb.getClass_sub_desc()%></p>
							<h2 class="shop_class_name"><%=cb.getClass_subject()%></h2>
							<p class="shop_class_price"><%=cb.getClass_price() %>원</p>
						</div>
						<div class="shop_class_infobox2">
							<span class="shop_class_label">지점</span>
							<ul id="classPlace"></ul>
						</div>
						
						<div class="shop_class_time_box">
							<label class="shop_class_label">수강 시간</label>
							<select name="fd_time" id="classReservNum" class="shop_class_time_input">
								<option value="">시간을 선택하세요</option>
							</select>
						</div>
						<div>
							<label>수강 인원</label>
							<input type="number" name="r_num" id="r_num" min="0" required>
						</div>
					</div>
					<input type="hidden" name="fc_date" id="date" value="<%=cb.getClass_date()%>">
					<input type="hidden" name="f_id" id="f_id" value="<%=cb.getClass_id()%>">
					<input type="hidden" name="fd_place" id="place" value="<%=cb.getClass_place()%>">
					<input type="hidden" name="subject" id="subject" value="<%=cb.getClass_subject()%>">
					<input type="submit" value="신청하기">
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			// 이미지 전환
			$('.change_img').click(function(){
				$('.change_img').removeClass('active');
				$(this).addClass('active');
				var imgUrl = $(this).find('img').attr('src')
			 	$('.thumnail_main img').attr('src', imgUrl);
			});
		})
	</script>
</body>
</html>