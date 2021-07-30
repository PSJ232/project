<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<body>
 	 <!-- header -->
  	<jsp:include page="../inc/header.jsp" ></jsp:include>
  	<!-- header -->




	주문내역상세<br>
	[주문번호]
	<table>
		<tr>
			<td>배송일</td>
			<td>상품명</td>
			<td>가격</td>
			<td>배송비</td>
			<td>상태</td>
		</tr>
	</table>
	
	배송지정보<br>
	수령인이름[]<br>
	주소[]<br>
	연락처[]<br>
	
	편지정보-비회원<br>
	상품명[]
	<textarea rows="10" cols="20"></textarea><br>
	
	결제정보<br>
	상품 합계[]원<br>
	배송비 0원<br>
	쿠폰 할인 -0원<br>
	총 결제금액: []원<br>
	
	결제방법:[]<br>
	결제일시:[]<br>
	
	*현금 영수증 발행은 1:1문의를 이용 부탁드립니다.<br>
	
	<input type="button" value="홈으로 돌아가기" onclick="location.href='./'">
	
	
	
		<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>