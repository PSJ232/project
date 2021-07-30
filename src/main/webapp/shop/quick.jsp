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
<script type="text/javascript">
	function sortSelect(sortNum) {
		switch(sortNum) {
			case "1" : location.replace("Quick.shop?sort=1"); break;
			case "2" : location.replace("Quick.shop?sort=2"); break;
			case "3" : location.replace("Quick.shop?sort=3"); break;
		}
	}
</script>
<%
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList");
int sort = 1;
if(request.getParameter("sort")!=null) {
	sort = Integer.parseInt(request.getParameter("sort"));
}
%>
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<!-- header -->
  	<jsp:include page="../inc/header.jsp" ></jsp:include>
  	<!-- header -->

꾸까 당일배송<br>
가장 예쁘고 싱그러운 꽃 그대로<br>
오늘 주문하고, 오늘 받아보세요.<br>
 
	<select name="item_sort" size="1" onchange="sortSelect(this.value)">
		<option value="1" <%if(sort==1){%>selected<%} %>>추천순</option>
		<option value="2" <%if(sort==2){%>selected<%} %>>인기순</option>
		<option value="3" <%if(sort==3){%>selected<%} %>>신상품순</option>
	</select>
	<%
	for (ItemBean item : itemList) {
		int i_id = item.getI_id();
		float i_discount = item.getI_discount();
		String percent = (int)((1 - i_discount) * 100) + "%";
		item.getI_itemstatus();
		item.getI_price();
		int price = (int)(item.getI_price() * i_discount)/100*100;
	%>
		<table>
		<%if (item.getI_itemstatus().equals("당일배송")){%>
			<tbody>
				<tr><td><a href="QuickContent.shop?i_id=<%=i_id%>"><img src="../admin_layout/upload/<%=item.getI_img()%>" width="200" ></a></td></tr>
				<tr><td><%=item.getI_desc() %></td></tr>
				<tr><td><a href="QuickContent.shop?i_id=<%=i_id%>"><%=item.getI_name() %></a></td></tr>
				<tr><td><%if(i_discount!=1){%><%=percent %> <%=NumberFormat.getInstance().format(item.getI_price())%>-> <%}%><%=NumberFormat.getInstance().format(price) %></td></tr>
				<tr><td><%=item.getI_size()%> size 무료배송</td></tr>
			</tbody>
		<%} %>
		</table>
	<%} %>
	

	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>