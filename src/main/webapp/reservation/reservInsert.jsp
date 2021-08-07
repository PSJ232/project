<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.MemberBean"%>
<%@page import="vo.ClassDetailBean"%>
<%@page import="vo.ClassBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
int r_num = (int) request.getAttribute("r_num");
MemberBean mb = (MemberBean) request.getAttribute("member");
ClassBean fclass = (ClassBean) request.getAttribute("fclass");
ClassDetailBean fclassDetail = (ClassDetailBean)request.getAttribute("fclass_detail");
String startDate = (String) request.getAttribute("startDate");
String fd_time = (String) request.getAttribute("fd_time");
float grade = (float) request.getAttribute("grade");
DecimalFormat dc = new DecimalFormat("###,###,###,###");
String class_price = dc.format(fclass.getClass_price()*r_num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>	플라워클래스 예약</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/reservpay.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<jsp:include page="/inc/header.jsp" ></jsp:include>
	<!-- header -->

	<div id="container">
		<form action="ReservInsertPro.od" method="post">
			<h1 class="rpay_title">오프라인 주문</h1>
			<div class="rpay_container">				
				<div class="rpay_confirm_box">
					<h5 class="rpay_subtitles">
						<span class="rpay_subtitle">수강 내용 확인</span>
					</h5>
					<div class="rpay_content">
						<div class="rpay_content_left">
							<img alt="class exmaple image" src="img_upload/<%=fclass.getClass_main_img()%>">
						
						</div>
						<div class="rpay_content_right">
							<div class="rpay_subcontent_left">
								<span class="rpay_class_name">[<%=fclassDetail.getPlace()%>]<%=fclass.getClass_subject() %></span><br>
								<span>수강시작일 : <%=startDate %>요일, <%=fclassDetail.getDate() %>, <%=fd_time%></span><br>
								<span>지점 : <%=fclassDetail.getPlace()%>점</span><br>
								<span>수강인원 : <%=r_num %>명</span><!-- 요건 따로 값 저장하기 -->
							</div>
							<div class="rpay_subcontent_right">
								<span><%=class_price%></span><span>원</span> <!-- 인원에 따른 가격 계산 -->
								<input type="hidden" id="fee" value="<%=fclass.getClass_price()*r_num%>">
							</div>
						</div>
					</div>
				</div>
				
				<div>
					<!-- m_id로  m_name, m_phone가져오기-->
					<h5 class="rpay_subtitles">
						<span class="rpay_subtitle">신청인 정보</span>
					</h5>
					<ul>
						<li class="rpay_subtitle_layout">
							<label class="rpay_label">이름</label>
							<input class="rpay_input_long" type="text" value="<%=mb.getM_name()%>" readonly>
						</li>
						<li class="rpay_subtitle_layout">
							<label class="rpay_label">연락처</label>
							<input class="rpay_input_long" type="text" value="<%=mb.getM_phone()%>" readonly>
						</li>
					</ul>
				</div>
				
				
				<div>
					<h5 class="rpay_subtitles">
						<span class="rpay_subtitle">쿠폰 / 포인트</span>
					</h5>
					<div class="rpay_point_content">
						<label class="rpay_label">포인트</label>
						<!-- point 테이블에서 m_id가지고 조회  -->
						<!-- js로 가진 포인트보다 더 많은 경우
								사용가능한 포인트는 000입니다 알리기
								더 적거나 같은 경우(사용가능한 경우) 
								최종 결제금액의 포인트 할인에 값 전달-->
						
						<div class="rpay_price_right">
							<input class="rpay_input_mid" type="text" id="use_point" name="use_point" placeholder="0" value="">
							<input class="rpay_mid_btn" type="button" id="pointApplybtn" value="적용"> 
							<div>
								<span>- 사용가능 포인트 : </span><span id="avail_point"><%=mb.getM_point()%></span>
								<input type="checkbox" id="pointAll" value="<%=mb.getM_point()%>">체크이미지
								<span>전액사용</span>
							</div>
						</div>

					</div>
				</div>
				
				<div>
					<h5 class="rpay_subtitles">
						<span class="rpay_subtitle">최종 결제 금액</span>
					</h5>
					<div>
						<div class="rpoay_discount_confirm">
							<span>포인트 할인</span>
							<span id="use_point2"> - 0원</span>
						</div>
						
						<div class="rpoay_discount_confirm">
							<span>등급 할인</span>
							<span> - 0원</span>
						</div>										
					</div>
					<div class="rpoay_total_price_box">
					<!-- 원 가격 - (포인트 할인 + 등급 할인) 한 가격이 30000원 이상일 때
							3만원
							 원 가격 - (포인트 할인 + 등급 할인) 한 가격이 30000원 이하일 때 
							 원 가격 - (포인트 할인 + 등급 할인) 한 가격 표시 할지 의논필요-->
						<div>
							<span>총 결제 금액(예약금)</span>
						</div>
						<div><span id="total_fee_print"><%=fclass.getClass_price()%></span><span>원</span></div>
					</div>
				</div>
				
				
				<div>
					<h5 class="rpay_subtitles">
						<span class="rpay_subtitle">결제 수단</span>
					</h5>
					<table class="rpay_paymethod">
<!-- 						<tr> -->
<!-- 							<td>네이버 페이<input type="button" id="r_payment" name="r_payment" value="naverpay"></td> -->
<!-- 							<td>카카오<input type="button" name="r_payment" value="kakaopay"></td> -->
<!-- 							<td>신용카드<input type="button" name="r_payment" value="html5_inicis"></td> -->
<!-- 							<td>payco<input type="button" name="r_payment" value="payco"></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>무통장 입금<input type="radio" name="r_payment" value=""></td> -->
<!-- 							<td>휴대폰 결제<input type="radio" name="r_payment" value="mobilians"></td> -->
<!-- 							<td colspan="2"></td> -->
<!-- 						</tr> -->
						<tr>
							<td><button type="button" id="rpay_cash clicked" onclick="btnclick('cash')">현금</button></td>
							<td><button type="button" id="rpay_card" onclick="btnclick('card')">카드</button></td>
						</tr>
					</table>
				</div>
				<!-- r_date service 페이지에서 생성 -->
				<!-- r_id 생성 -->
				<div>
					<input type="hidden" id="total_fee" name="total_fee" value="">
					<!-- 등급할인 금액 -->
					<input type="hidden" id="grade_discount" name="grade_discount" value="<%=fclass.getClass_price()-(grade*fclass.getClass_price())%>">
					<!-- 포인트 할인금액 -->
					<input type="text" id="r_payment" name="r_payment" value="">
					<input type="hidden" id="point_discount" name="point_discount" value="">
					<input type="hidden" id="m_id" value="<%=mb.getM_id()%>">
					<input type="hidden" name="f_id" value="<%=fclass.getClass_id()%>">
					<input type="hidden" value="<%=r_num%>">
					<input type="hidden" name="fd_id" value="<%=fclassDetail.getClass_id()%>">
					<input type="hidden" name="r_num" value="<%=r_num%>">
					<input type="submit" value="결제하기">
				</div> 
			</div>	
		</form>
	</div>
	
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#total_fee').val($('#total_fee_print').text());
			$('#use_point').val(0);
			
			$('#pointAll').change(function(){
				if($('#pointAll').is(':checked')){
	 				$('#use_point').val($('#pointAll').val());
				}
			});
			
			$('#pointApplybtn').click(function(){
				let use_point = $('#use_point').val();
				let fee = $('#fee').val();
				if(use_point.trim()!=""){
					$('#use_point2').html('- '+use_point+'원');
					$('#point_discount').val(use_point);
					$('#total_fee').val(parseInt(fee) - parseInt(use_point));
					$('#total_fee_print').html(parseInt(fee) - parseInt(use_point));
					$('#use_point').val('');
				}
			});
			
// 			$('#rpay_cash').click(function(){
// 				alert('ss');
// // 				$('#r_payment').val('cash');
// 			});
			
// 			$('#rpay_cash').click(function(){
// // 				$('#r_payment').val('card');
// 			});

		});
		
		function btnclick(paymethod){
			$('#r_payment').val(paymethod);
		}
	</script>
</body>
</html
>