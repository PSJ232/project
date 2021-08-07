<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	ClassBean cb = (ClassBean) request.getAttribute("cb");
	DecimalFormat dc = new DecimalFormat("###,###,###,###");
	String class_price = dc.format(cb.getClass_price());
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
        
		// 이미지 전환
		$('.change_img').click(function(){
			$('.change_img').removeClass('active');
			$(this).addClass('active');
			var imgUrl = $(this).find('img').attr('src')
		 	$('.thumnail_main img').attr('src', imgUrl);
		});
		
		$('.shop_class_price').val().toLocaleString();
		$('.total_fee')
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/inc/header.jsp" ></jsp:include>
	<!-- header -->
	
	<div id="container"><!-- 전체 -->
		<div class="shop_class_layout"><!-- 예약 정보 입력 레이아웃-->
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
				<form action="ReservInsert.od" method="post" name="reservForm" onsubmit="return check()">
					<div>
						<div class="shop_class_infobox1">
							<p class="shop_class_desc"><%=cb.getClass_sub_desc()%></p>
							<h2 class="shop_class_name"><%=cb.getClass_subject()%></h2>
							<p class="shop_class_price"><%=class_price%>원</p>
						</div>
						<div class="shop_class_infobox2">
							<p><%=cb.getClass_place() %>점,</p>
							<p>원데이 클래스</p>
						</div>
						<div class="shop_class_infobox3">
							<span class="shop_class_label">지점</span>
							<ul id="classPlace"></ul>
						</div>
						
						<div class="shop_class_time_box">
							<label class="shop_class_label">수강 시간</label>
							<select name="fd_time" id="classReservNum" class="shop_class_time_input">
								<option value="">시간을 선택하세요</option>
							</select>
						</div>
						<div class="shop_class_num_box">
							<label class="shop_class_label">수강 인원</label>
							<span>
								<input class="shop_class_btn class_minus_btn" type="button" value="-" onclick="ctlNum(-1,<%=cb.getClass_price()%>)"></input>
								<input class="shop_class_num" name="r_num" type="text" id="r_num" min="1" value="1" readonly>
								<input class="shop_class_btn"  type="button" value="+" onclick="ctlNum(1,<%=cb.getClass_price()%>)"></input>
							</span>
							<p id="shop_class_num_info"></p>
						</div>
						<div class="shop_class_price_box">
							<div>수강금액</div>
							<div class="total_fee"><%=class_price%> 원</div>
						</div>
						<div class="shop_class_total_price">
							<span>총 수강금액</span>
							<span class="total_fee"><%=class_price%> 원</span>
						</div>
					</div>
					<input type="hidden" name="class_price" id="class_price" value="<%=cb.getClass_price()%>">
					<input type="hidden" name="fc_date" id="date" value="<%=cb.getClass_date()%>">
					<input type="hidden" name="f_id" id="f_id" value="<%=cb.getClass_id()%>">
					<input type="hidden" name="fd_place" id="place" value="<%=cb.getClass_place()%>">
					<input type="hidden" name="subject" id="subject" value="<%=cb.getClass_subject()%>">
					<input type="submit" value="신청하기" class="shop_class_submit_btn">
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<script>
		function ctlNum(num, price){
			var currentNum = document.getElementById('r_num').value;
			if(currentNum == 1){
				if(num==1){
					document.getElementById('r_num').value = Number(currentNum) + 1;
				} 
			} else if(currentNum == 5){
				document.getElementById('shop_class_num_info').innerText = '최대 5명까지 예약할 수 있습니다';
					if(num!=1) {
					document.getElementById('shop_class_num_info').innerText = '';
					document.getElementById('r_num').value = Number(currentNum) - 1;
				}
			} else if(currentNum > 1 && currentNum < 5){
				if(num==1){
					document.getElementById('r_num').value = Number(currentNum) + 1;
				} else {
					document.getElementById('r_num').value = Number(currentNum) - 1;
				}
			} 
			
			var elements = document.querySelectorAll('.total_fee');
			for(var i=elements.length; i--;){
				elements[i].textContent = (Number(price)*document.getElementById('r_num').value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' 원';
			}

		}
		
		function check(){
			if(document.reservForm.fd_time.value==''){
				alert('선택되지 않은 옵션이 있습니다');
				return false;
			}
		}
	</script>

	
</body>
</html>