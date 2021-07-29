<%@page import="java.text.NumberFormat"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList");

%>
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
  <!-- header -->
  	<jsp:include page="../inc/adminHeader.jsp" ></jsp:include>
  <!-- header -->
  
	<select name="item_sort" size="1">
			<option value="1" selected>추천순</option>
			<option value="2">인기순</option>
			<option value="3">신상품순</option>
	</select>
	<%for (ItemBean item : itemList) {
		item.getI_price();
		float i_discount = item.getI_discount();
		String percent = (int)((1 - i_discount) * 100) + "%";
		item.getI_itemstatus();
		int price = (int)(item.getI_price() * i_discount)/100*100;
	%>
		<table>
			<tbody>
				<tr><td><img src="../admin_layout/upload/<%=item.getI_img()%>" width="200" ></td></tr>
				<tr><td><%=item.getI_desc() %></td></tr>
				<tr><td><%=item.getI_name() %></td></tr>
				<tr><td><%if(i_discount!=1){%><%=percent %> <%=NumberFormat.getInstance().format(item.getI_price())%>-> <%}%><%=NumberFormat.getInstance().format(price) %></td></tr>
				<tr><td><%=item.getI_size()%> size 무료배송</td></tr>
			</tbody>
		</table>
	<%} %>
	



	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>