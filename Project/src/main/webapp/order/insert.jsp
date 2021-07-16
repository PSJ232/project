<%@page import="vo.MemberBean"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
ItemBean itemDetail = (ItemBean) request.getAttribute("itemDetail");
MemberBean memberDetail = (MemberBean) request.getAttribute("memberDetail");

%>
<body>
	<h1>주문/결제</h1>
	
	<h3>주문내역 확인</h3>
	
	<%=itemDetail.getI_id() %><br>
	<%=itemDetail.getI_name() %><br>
	<%=itemDetail.getI_price() %><br>
	<%=itemDetail.getI_size() %><br>
	<%=itemDetail.getI_desc() %><br>
	<%=itemDetail.getI_detailpage() %><br>
	<%=itemDetail.getI_discount() %><br>
	<%=itemDetail.getI_dpstatus() %><br>
	<%=itemDetail.getI_inven() %><br>
	<%=itemDetail.getI_itemstatus() %><br>
	
	
	
	
	
	<hr>
	<h3>주문자 정보</h3>
	이름 : <%=memberDetail.getM_name() %><br>
	전화번호 : <%=memberDetail.getM_phone() %><br>
	
	
	
	<hr>
	<h3>발신인 정보</h3>
	<hr>
	이름 <input type="text"><br>
	<h3>배송지 정보</h3> | 받는 분이 입력
	<hr>
	받는분 이름 <input type="text" placeholder="이름을 입력해주세요."><br>
	받는분 연락처 
	<select>
		<option>010</option>
		<option>011</option>
		<option>016</option>
		<option>017</option>
		<option>018</option>
		<option>019</option>
	</select>
	&nbsp;&nbsp;<input type="text">
	&nbsp;&nbsp;<input type="text"><br>
	우편번호 <input type="text" placeholder="우편번호 검색">&nbsp;&nbsp;<input type="button" value="찾기"><br>
	주소 <input type="text"><br>
		<input type="text">
		<p>토요일 수령 선택 시 주의사항<br>
		토요일 수령을 선택하실 경우, 회사 주소는 배송이 어려워요.<br>
		자택이나 수령인이 직접 받으실 수 있는 주소지로 입력 부탁드릴게요.</p>
	<h3>쿠폰/포인트</h3>
	<hr>
	쿠폰 할인 <input type="text" placeholder="코드를 입력해주세요"><input type="button" value="적용"><br>
	포인트 <input type="text" placeholder="0"><input type="button" value="적용"><br>
	<h3>최종 결제 금액</h3>
	<hr>
	<h3>결제 수단</h3>
	<hr>
	<input type="submit" value="결제하기">
</body>
</html>