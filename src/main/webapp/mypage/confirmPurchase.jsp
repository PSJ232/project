<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 확정</title>
<%
String od_id = request.getParameter("od_id");
%>
</head>
<body>
<h1>구매 확정</h1>
<form action="ConfirmPurchasePro.od" method="post" >
<h6>구매를 확정하시겠습니까?</h6>
	<input type="hidden" value="<%=od_id %>" name="od_id">
	<input type="button" value="취소" onclick="javascript:window.close()">
	<input type="submit" value="구매 확정">
</form>
</body>
</html>