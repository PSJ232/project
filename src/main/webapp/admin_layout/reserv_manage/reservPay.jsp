<%@page import="vo.MemberBean"%>
<%@page import="vo.ClassDetailBean"%>
<%@page import="vo.ClassBean"%>
<%@page import="vo.ReservBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	ReservBean rb = (ReservBean) request.getAttribute("reservBean");
	ClassBean cb = (ClassBean) request.getAttribute("fclass");
	ClassDetailBean cdb = (ClassDetailBean) request.getAttribute("fclass_detail");
	MemberBean mb = (MemberBean) request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  	    pg: "<%=rb.getR_payment()%>", //결제플랫폼 네이버 카카오 등등
  	    pay_method: "card", //결제수단 카드 고정
  	    merchant_uid: "<%=rb.getR_id()%>", //제품 id
  	    name: "<%=cb.getClass_subject()%>", //제품명
  	    amount: 100, //가격
  	    buyer_email: "<%=mb.getM_id()%>", //구매자 이메일(=사계 아이디)
  	    buyer_name: "<%=mb.getM_name()%>", //구매자 이름
  	    buyer_tel: "<%=mb.getM_phone()%>", //구매자 전화번호
  	  }, function (rsp) { // callback
  	    if (rsp.success) {
  	    	//결제 완료시
  	    	 // jQuery로 HTTP 요청
  	    	var msg = '결제가 완료되었습니다.';
  	        msg += '고유ID : ' + rsp.imp_uid;
  	        msg += '상점 거래ID : ' + rsp.merchant_uid;
  	        msg += '결제 금액 : ' + rsp.paid_amount;
  	        msg += '카드 승인번호 : ' + rsp.apply_num;
  	        console.log(msg);
  	        isSuccess = true;
  	    } else {
  	    	//결제 실패시 
  	    	//ReservMiddleCancle.ad
  	    	//
  	    	var msg = '';
  	        msg += rsp.error_msg;
  	        location.href='ReservMiddleCancle.ad?imp_uid=<%=rb.getR_id()%>&merchant_uid=<%=rb.getF_id()%>';
  	    }
  	  alert(msg);
  	  });
  	  
  	  
  	});
  </script>
</head>
<body>
</body>
</html>