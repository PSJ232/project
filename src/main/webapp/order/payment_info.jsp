<%@page import="java.text.NumberFormat"%>
<%@page import="vo.MemberBean"%>
<%@page import="vo.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
OrderBean ob = (OrderBean) request.getAttribute("orderDetail");
MemberBean mb = (MemberBean) request.getAttribute("memberDetail");

int pay = ob.getO_amount() + ob.getO_point() + ob.getO_gdiscount();


String name = "";
String path = "";
if(mb == null) {
	name = ob.getO_sender();
	path = "location.href='VisitorLogin.me'";
} else {
	name = mb.getM_name();
	path = "location.href='OrderMypageDetailList.od'";
}


%>
</head>
<body>

<%=name%>님의 주문이 완료되었습니다.
플로리스트의 정성으로, 행복을 담아 보내드릴게요!

주문번호:#<%=ob.getO_id() %>


<%if(ob.getO_payment()==0){ %>

입금계좌 안내
다음 계좌로 입금해주시면 주문이 완료됩니다.

계좌번호 기업은행 274-072066-01-041
예금주 (주)사계
입금금액 <%=NumberFormat.getInstance().format(pay) %>원
보내시는분 <%=ob.getO_sender() %>
입금기한 선택하신 수령일 1일 전 오후 2시까지

<%} %>

상세내역은 아래 주문내역조회에서 확인하실 수 있습니다.


<button onclick="location.href='./'">쇼핑 계속하기</button>
<button onclick="<%=path%>">주문 내역 조회</button>




</body>
</html>