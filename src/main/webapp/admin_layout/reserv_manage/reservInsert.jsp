<%@page import="vo.MemberBean"%>
<%@page import="vo.ClassDetailBean"%>
<%@page import="vo.ClassBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ClassBean fclass = (ClassBean)request.getAttribute("fclass");
	ClassDetailBean fclassDetail = (ClassDetailBean)request.getAttribute("fclass_detail");
// 	MemberBean memberDetail = (MemberBean)request.getAttribute("memberDetail");
	String startDate = (String) request.getAttribute("startDate");
	int r_num = (int)request.getAttribute("r_num");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>	플라워클래스 예약</title>
<script src="../script/jquery-3.6.0.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<!--  
	private int r_id;
	private String m_id;
	private int f_id;
	private int r_num;
	private String r_payment;
	private String r_date;
 -->
	<div>
		<form action="ReservInsertPro.ad" method="post">
			<h1>오프라인 주문</h1>
			<div>
				<h5>수강 내용 확인</h5>
				<div>
					<img alt="" src="">
					<div>
						<!-- request에서 f_id, m_id로 (f_subject, fr_time, fr_date) 값 받아오기 -->
						<span>[<%=fclassDetail.getPlace()%>]<%=fclass.getClass_subject() %></span><br>
						<span>수강시작일 : <%=startDate %>요일, <%=fclassDetail.getDate() %>, <%=fclassDetail.getTime()%>:00</span><br>
						<span>지점 : <%=fclassDetail.getPlace() %>지점</span><br>
						<span>수강인원 : <%=r_num %></span><!-- 요건 따로 값 저장하기 -->
					</div>
					<div>
						<span><%=fclass.getClass_price()%>원</span> <!-- 인원에 따른 가격 계산 -->
					</div>
				</div>
				
				<div>
					<!-- m_id로  m_name, m_phone가져오기-->
					<h5>신청인 정보 <span>김갑생, 010-1111-1111</span></h5>
					<ul>
						<li>
							<label>이름</label>
							<input type="text" value="">
						</li>
						<li>
							<label>연락처</label>
							<input type="text" value="">
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
						<input type="text" value="">
						<input type="button" value="적용"> 
						<div>
							<span>- 사용가능 포인트 : 1,000</span>
							<span><!-- 체크 이미지 --></span>
							<span>전액사용</span>
						</div>
					</div>
				</div>
				
				<div>
					<h5>최종 결제 금액</h5>
					<div>
						<div>
							<span>포인트 할인</span>
							<span> - 0원</span>
						</div>
						
						<div>
						<!-- 페이지 넘어올 떄부터 m_id로 g_id얻어서
								grade 테이블의 g_discount를 얻어 
								원가격 - (원가격 * g_discount) 값 넣기-->
							<span>등급 할인</span>
							<span> - 0원</span>
						</div>										
					</div>
					<div>
					<!-- 원 가격 - (포인트 할인 + 등급 할인) 한 가격이 30000원 이상일 때
							3만원
							 원 가격 - (포인트 할인 + 등급 할인) 한 가격이 30000원 이하일 때 
							 원 가격 - (포인트 할인 + 등급 할인) 한 가격 표시-->
						<span>총 결제 금액(예약금)</span>
						<span>30,000</span>
					</div>
				</div>
				
				
				<div>
					<h5>결제 수단</h5>
					<table border="1">
						<!-- 선택한 것 js로 값 받아가야겠네 -->
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
<%-- 					<input type="hidden" id="m_id" value="<%=memberDetail.getM_id()%>"> --%>
					<input type="hidden" name="f_id" value="<%=fclass.getClass_id()%>">
					<input type="text" value="<%=r_num%>">
					<input type="hidden" name="fd_id" value="<%=fclassDetail.getClass_id()%>">
					<input type="hidden" name="r_num" value="<%=r_num%>">
					<input type="submit" value="결제하기">
				</div> 
			</div>	
		</form>
	</div>

</body>
</html
>