<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주문관리상세</title>
<style>
	.container #delivery_info label, #payment_info label {
		width: 150px; 
		display: inline-block;
	}
	
	.container #product_list,#payment_info {
		display: inline-block;
		width: 400px;
	}
	#product_list table {
		width: 450px;
	}
	
	.sub_container {
		display: flex;
		
	}
</style>
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container">
   	<!-- header -->
   	<jsp:include page="../inc/adminHeader.jsp" ></jsp:include>
   	<!-- header -->
   	
    <!-- nav -->
	<jsp:include page="../inc/navigation.jsp" ></jsp:include>
	<!-- nav -->
	
	<div class="container"> <!-- css layout요소 추가 -->
		<h1>Order Detail</h1>
		<div id="delivery_info">
			<h3>배송지 정보</h3>
			<label>주문자</label><input type="text" value="홍길동">
			<label>주문자 전화번호</label><input type="text" value="010-0000-0000"><br>
			<label>받는자</label><input type="text" value="김길동">
			<label>받는자 전화번호</label><input type="text" value="010-0000-0000"><br>
			<label>주소</label><input type="text" value="부산광역시 동래구"> <label>상세주소</label><input type="text" value="oo아파트 oo동 oo호"><br>
			<label>요청 배송일</label><input type="text" value="2021-07-11"><br>
			<label>배송시 요청사항</label><input type="text" value="문앞에두고가주세요">
		</div>
		<div class="sub_container">
		<div id="payment_info">
			<h3>결제 정보</h3>
			<label>총 상품금액</label><input type="text" value="50000"><br>
			<label>할인금액</label><input type="text" value="5000"><br>
			<label>적립금사용</label><input type="text" value="3000"><br>
			<label>결제수단</label><input type="text" value="카드"><br>
			<label>최종결제금액</label><input type="text" value="42000">
		</div>
		<div id="product_list">
			<h3>상품 리스트</h3>
			<table border="1">
				<tr><th>no</th><th>product</th></tr>
				<tr><td>1</td><td>상품1</td></tr>	
				<tr><td>1</td><td>상품1</td></tr>	
				<tr><td>1</td><td>상품1</td></tr>	
				<tr><td>1</td><td>상품1</td></tr>	
			</table>
		</div>
		</div>
	</div>
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>