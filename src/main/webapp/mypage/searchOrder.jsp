<%@page import="java.sql.Date"%>
<%@page import="vo.OrderBean"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function setOrder() {
		opener.window.document.fr.oid.value = searchOrder.oid.value;
	}
</script>
</head>
<body>
<h3>주문 상품을 선택해주세요.</h3>
<%
ArrayList<OrderBean> orderList = (ArrayList<OrderBean>) request.getAttribute("orderList"); 
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList");
%>

<%
if(request.getParameter("o_id")==null) {
	%>
고객님의 주문 내역이 존재하지 않습니다.
	<%
} else {
	int o_id = Integer.parseInt(request.getParameter("o_id"));
	%>
	주문 상품을 선택해주세요.
	<form name="searchOrder">
	<input type="hidden" name="oid" value="<%=o_id%>">
	<table border="1">
		<tr>
		<td>주문일자</td>  <!--Date o_rdate  -->
		<td>상품 내역</td> <!--String i_name  -->
		<td><input type="hidden"></td> 
		</tr>
	<%
	for(int i=0; i<orderList.size();i++) {
		Date o_rdate = orderList.get(i).getO_rdate();
		String i_name = itemList.get(i).getI_name();
	%>
		<tr>
		<td><%=o_rdate %></td>
		<td><%=i_name %></td>
		<td><input type="button" value="선택" onclick="setOrder()"></td>
		</tr>
		</table>
		</form>
	<%
	}

}
%>
</body>
</html>