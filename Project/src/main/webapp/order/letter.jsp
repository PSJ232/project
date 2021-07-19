<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
int i_id = Integer.parseInt(request.getParameter("i_id"));
int od_qty = Integer.parseInt(request.getParameter("od_qty"));
%>
<body>
편지지

<form action="OrderForm.od" method="post">

	(임시)편지지번호입력<br>
	<input type="text" name="l_id"><br>
	0선택안함,1감사,2응원,3사랑<br>
	4직접입력:
	<input type="text" name="od_message"><br>
	
	(테스트는 상품페이지에서 상품번호001과 갯수1개를 선택하고 주문을 진행했을때를 가정)<br>
	<input type="hidden" name="i_id" value="<%=i_id%>">
	<input type="hidden" name="od_qty" value="<%=od_qty%>">
	<input type="submit" value="선택완료">
</form>



</body>
</html>