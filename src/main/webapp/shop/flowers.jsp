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
			case "1" : location.replace("Flowers.shop?sort=1"); break;
			case "2" : location.replace("Flowers.shop?sort=2"); break;
			case "3" : location.replace("Flowers.shop?sort=3"); break;
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
<link rel="stylesheet" href="css/flowers.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
	<body>	
		<!-- header -->
	  	<jsp:include page="../inc/header.jsp" ></jsp:include>
	  	<!-- header -->
	  	<div class="flowers_container">
				<div class="flowers_subject">
					<div class="inbox">
						<div class="tbl">
							<div class="td">
								<h3 class="title">꾸까 꽃다발</h3>
								<p class="desc"> 계절을 가득 담은 꽃다발로</p>
								<p class="desc_2">당신의 일상을 특별한 날로 만들어보세요.</p>
							</div>
						</div>
				 	</div>
				 </div>
					 
			 <div class="sort">
					<select name="item_sort" class="select_product_view" size="1" onchange="sortSelect(this.value)">
						<option value="1" <%if(sort==1){%>selected<%} %>>추천순</option>
						<option value="2" <%if(sort==2){%>selected<%} %>>인기순</option>
						<option value="3" <%if(sort==3){%>selected<%} %>>신상품순</option>
					</select>
			</div>
				<%
				for (ItemBean item : itemList) {
					int i_id = item.getI_id();
					float i_discount = item.getI_discount();
					String percent = (int)(100 - i_discount * 100) + "%";
					item.getI_itemstatus();
					item.getI_price();
					int price = (int)(item.getI_price() * i_discount)/100*100;
				%>
				<div class="flower_list">
					<div class="inbox">
						<table>
						<%if (item.getI_category() == 1 || item.getI_category() == 2){%> <!-- 1:일반배송, 2:당일배송  -->
							<tbody>
								<tr><td><a href="FlowersContent.shop?i_id=<%=i_id%>"><img src="../admin_layout/upload/<%=item.getI_img()%>" class="img"></a></td></tr>
								<tr><td><span class="desc"><%=item.getI_desc() %></span></td></tr>
								<tr><td><span class="item_name"><a href="FlowersContent.shop?i_id=<%=i_id%>"><%=item.getI_name() %></a></span></td></tr>
								<tr><td><span class="discount"><%if(i_discount!=1){%><%=percent %></span> <span class="origin_price"><%=NumberFormat.getInstance().format(item.getI_price())%>-></span><span class="price"><%}%><%=NumberFormat.getInstance().format(price) %></span></td></tr>
								<tr><td class="more"><span class="size"><%=item.getI_size()%></span> <span class="size_txt">size</span> <span class="delivery">무료배송</span></td></tr>
							</tbody>
						<%} %>
						</table>
					</div>
				</div>
				<%} %>
		</div>
	
		<!-- footer -->
		<jsp:include page="../inc/footer.jsp"></jsp:include>
		<!-- footer -->
	</body>
</html>