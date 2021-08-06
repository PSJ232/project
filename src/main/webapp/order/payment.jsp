<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function paymentSuccess(){
		window.opener.order.o_payment.value = 1; // 신용카드 1고정..
		window.opener.order.submit();
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
int pay_amount = Integer.parseInt(request.getParameter("pay_amount"));
String m_id = request.getParameter("m_id");
String name = m_id.split("@")[0].toString();
	
int pay_gdiscount = Integer.parseInt(request.getParameter("pay_gdiscount"));
int pay_point = Integer.parseInt(request.getParameter("pay_point"));

// 최종결제가격
int finalAmount = pay_amount - pay_gdiscount - pay_point; 
// 결제관리번호

%>
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  	  var isSuccess;
  	  var IMP = window.IMP; // 생략해도 괜찮습니다.
  	  IMP.init("imp03490268"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
  	  
  	  // IMP.request_pay(param, callback) 호출
  	  IMP.request_pay({ // param
  	    pay_method: "card", //결제수단 카드 고정
  	    merchant_uid: 'merchant_' + new Date().getTime(), //제품 id
  	    name: "사계-꽃주문", //제품명
  	    amount: 100, //가격
  	    buyer_name: '<%=name %>님',
  	    buyer_email: '<%=m_id %>' //구매자 이메일(=사계 아이디)
  	  }, function (rsp) { // callback
  	    if (rsp.success) {
  	    	//결제 완료시
  	    	 // jQuery로 HTTP 요청
//   	    	var msg = '결제가 완료되었습니다.';
//   	        msg += '\n고유ID : ' + rsp.imp_uid;
//   	        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
//   	        msg += '\n결제 금액 : ' + rsp.paid_amount;
//   	        msg += '\n카드 승인번호 : ' + rsp.apply_num;
  	        console.log(msg);
  	        isSuccess = true;
  	      	paymentSuccess();
  	    } else {
  	    	//결제 실패시 
//   	    	var msg = '결제가 승인되지않았습니다. 다시 시도해주세요.';
  	    }
//   	  	alert(msg);
  	  });
	self.close();
  	});
  </script>
</head>
</html>