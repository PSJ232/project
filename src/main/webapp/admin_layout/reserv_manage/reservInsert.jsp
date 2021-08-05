<%@page import="vo.MemberBean"%>
<%@page import="vo.ClassDetailBean"%>
<%@page import="vo.ClassBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
int r_num = (int)request.getAttribute("r_num");
MemberBean mb = (MemberBean)request.getAttribute("memberDetail");
ClassBean fclass = (ClassBean)request.getAttribute("fclass");
ClassDetailBean fclassDetail = (ClassDetailBean)request.getAttribute("fclass_detail");
String startDate = (String) request.getAttribute("startDate");
String fd_time = (String)request.getAttribute("fd_time");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>	플라워클래스 예약</title>
<link rel="stylesheet" href="./css/admin.css">
<!-- <script src="../script/jquery-3.6.0.js"></script> -->
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/inc/adminHeader.jsp" ></jsp:include>
	<!-- header -->
	
	<!-- nav -->
	<jsp:include page="/inc/navigation.jsp" ></jsp:include>
	<!-- nav -->
	<div id="container">
		<form action="ReservInsertPro.ad" method="post">
			<h1>오프라인 주문</h1>
			<div>
				<h5>수강 내용 확인</h5>
				<div>
					<img alt="8" src="">
					<div>
						<span>[<%=fclassDetail.getPlace()%>]<%=fclass.getClass_subject() %></span><br>
						<span>수강시작일 : <%=startDate %>요일, <%=fclassDetail.getDate() %>, <%=fd_time%>:00</span><br>
						<span>지점 : <%=fclassDetail.getPlace()%>점</span><br>
						<span>수강인원 : <%=r_num %>명</span><!-- 요건 따로 값 저장하기 -->
					</div>
					<div>
						<span><%=fclass.getClass_price()*r_num%></span><span>원</span> <!-- 인원에 따른 가격 계산 -->
						<input type="hidden" id="fee" value="<%=fclass.getClass_price()*r_num%>">
					</div>
				</div>
				
				<div>
					<!-- m_id로  m_name, m_phone가져오기-->
					<h5>신청인 정보 <span><%=mb.getM_name() %>, <%=mb.getM_phone() %></span></h5>
					<ul>
						<li>
							<label>이름</label>
							<input type="text" value="<%=mb.getM_name()%>" readonly>
						</li>
						<li>
							<label>연락처</label>
							<input type="text" value="<%=mb.getM_phone()%>" readonly>
						</li>
					</ul>
				</div>
				
				
				<div>
					<h5>쿠폰 / 포인트</h5>
					<div>
						<label>포인트</label>
						<!-- point 테이블에서 m_id가지고 조회  -->
						<!-- js로 가진 포인트보다 더 많은 경우
								사용가능한 포인트는 000입니다 알리기
								더 적거나 같은 경우(사용가능한 경우) 
								최종 결제금액의 포인트 할인에 값 전달-->
						<input type="text" id="use_point" placeholder="0">
						<input type="button" id="pointApplybtn" value="적용"> 
						<div>
							<span>- 사용가능 포인트 : </span><span id="avail_point"><%=mb.getM_point()%></span>
							<input type="checkbox" id="pointAll" value="<%=mb.getM_point()%>">체크이미지
							<span>전액사용</span>
						</div>
					</div>
				</div>
				
				<div>
					<h5>최종 결제 금액</h5>
					<div>
						<div>
							<span>포인트 할인</span>
							<span id="use_point2"> - <%//= %>원</span>
						</div>
						
						<div>
						<!-- 페이지 넘어올 떄부터 m_id로 g_id얻어서
								grade 테이블의 g_discount를 얻어 
								원가격 - (원가격 * g_discount) 값 넣기-->
							<div>등급 할인</div>
							<div> - 0원</div>
						</div>										
					</div>
					<div>
					<!-- 원 가격 - (포인트 할인 + 등급 할인) 한 가격이 30000원 이상일 때
							3만원
							 원 가격 - (포인트 할인 + 등급 할인) 한 가격이 30000원 이하일 때 
							 원 가격 - (포인트 할인 + 등급 할인) 한 가격 표시 할지 의논필요-->
						<div>총 결제 금액(예약금)</div>
						<div><span id="total_fee_print"><%=fclass.getClass_price()%></span><span>원</span></div>
					</div>
				</div>
				
				
				<div>
					<h5>결제 수단</h5>
					<table border="1">
						<tr>
							<td>네이버 페이<input type="radio" id="r_payment" name="r_payment" value="naverpay"></td>
							<td>카카오<input type="radio" name="r_payment" value="kakaopay"></td>
							<td>신용카드<input type="radio" name="r_payment" value="html5_inicis"></td>
							<td>payco<input type="radio" name="r_payment" value="payco"></td>
						</tr>
						<tr>
							<td>무통장 입금<input type="radio" name="r_payment" value=""></td>
							<td>휴대폰 결제<input type="radio" name="r_payment" value="mobilians"></td>
							<td colspan="2"></td>
						</tr>
					</table>
				</div>
				<!-- r_date service 페이지에서 생성 -->
				<!-- r_id 생성 -->
				<div>
					<input type="hidden" id="total_fee" name="total_fee" value="">
					<input type="hidden" id="use_point3" name="use_point" value="">
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
	<script type="text/javascript">
		$(document).ready(function(){
			$('#total_fee').val($('#total_fee_print').text());
			
			$('#pointAll').change(function(){
				if($('#pointAll').is(':checked')){
	 				$('#use_point').val($('#pointAll').val());
				}
			})
			
			$('#pointApplybtn').click(function(){
				let use_point = $('#use_point').val();
				let fee = $('#fee').val();
				if(use_point.trim()!=""){
					$('#use_point2').html('- '+use_point+'원');
					$('#use_point3').val(use_point);
					$('#total_fee').val(parseInt(fee) - parseInt(use_point));
					$('#total_fee_print').html(parseInt(fee) - parseInt(use_point));
					$('#use_point').val('');
				}
			})

		});
	</script>
</body>
</html
>