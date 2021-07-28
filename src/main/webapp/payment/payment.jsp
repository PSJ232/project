<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
function requestPay(){
	//가맹점 식별코드
	IMP.init('imp96456497');
	IMP.request_pay({
	    pg : 'kcp',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '상품1' , //결제창에서 보여질 이름
	    amount : 100, //실제 결제되는 가격
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울 강남구 도곡동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        document.getElementById('p_id').innerText = rsp.imp_uid;
	        document.getElementById('merchant_uid').innerText = rsp.merchant_uid;
	        document.getElementById('amount').innerText = rsp.paid_amount;
	        document.getElementById('num').innerText = rsp.apply_num;
	        
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
		console.log("dkjflewkjlerkjlesdfsfsdfdsfsdfsdfwrj");    
	});
}
</script>
</head>
<body>
<button onclick="requestPay()">결제하기</button>
<h3 id="p_id"></h3>
<h3 id="merchant_uid"></h3>
<h3 id="amount"></h3>
<h3 id="num"></h3>
</body>
</html>