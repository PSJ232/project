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
		document.getElementById('oid').value = opener.document.getElementById('oid').value;
			
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
if(orderList==null) {
	%>
고객님의 주문 내역이 존재하지 않습니다.
	<%
} else {
	%>
	<form name="searchOrder">
	<table border="1">
		<tr>
		<td>번호</td>
		<td>주문일자</td>  <!--Date o_rdate  -->
		<td>상품 내역</td> <!--String i_name(상품 이름)  -->
		<td></td> 
		</tr>
	<%
	for(int i=0; i<orderList.size();i++) {
		Date o_rdate = orderList.get(i).getO_rdate();
		String i_name = itemList.get(i).getI_name();
	%>
		<tr>
		<td id="oid" value="<%=orderList.get(i).getO_id() %>"></td>
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