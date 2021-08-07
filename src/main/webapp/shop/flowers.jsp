<%@page import="java.text.NumberFormat"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 언제나 꽃과함께, NO.1 플라워브랜드</title>
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
<link rel="stylesheet" href="css/quick.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
	<body>	
		<!-- header -->
	  	<jsp:include page="../inc/header.jsp" ></jsp:include>
	  	<!-- header -->

		<div id="quick_banner_container">
			<div class="flowerList_banner_img">
				<div>
					<div class="quick_banner_textbox">
						<span>사계 꽃다발</span>
						<div>
							<span>계절을 가득 담은 꽃다발로</span>
							<span>당신의 일상을 특별한 날로 만들어보세요</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="shop_container">
				 <div>
					<select name="item_sort" size="1" onchange="sortSelect(this.value)">
						<option value="1" <%if(sort==1){%>selected<%} %>>추천순</option>
						<option value="2" <%if(sort==2){%>selected<%} %>>인기순</option>
						<option value="3" <%if(sort==3){%>selected<%} %>>신상품순</option>
					</select>
				</div>
				<table class="quick_list_layout">
					<%
					for (ItemBean item : itemList) {
						int i_id = item.getI_id();
						float i_discount = item.getI_discount();
						String percent = (int)(100 - i_discount * 100) + "%";
						item.getI_itemstatus();
						item.getI_price();
						int price = (int)(item.getI_price() * i_discount)/100*100;
						
						if (item.getI_category() == 1 || item.getI_category() == 2){
							%> <!-- 1:일반배송, 2:당일배송  -->
							<tbody class="quick_item_box">
								<tr>
									<td>
										<a href="FlowersContent.shop?i_id=<%=i_id%>">
											<img src="./admin_layout/upload/<%=item.getI_img()%>" class="quick_item_img">
										</a>
									</td>
								</tr>
								<tr class="quick_item_desc">
									<td><%=item.getI_desc() %></td>
								</tr>
								<tr class="quick_item_name">
									<td>
										<a href="FlowersContent.shop?i_id=<%=i_id%>"><%=item.getI_name() %></a>
									</td>
								</tr>
								<tr class="quick_item_price">
									<td>
										<%
										if(i_discount!=1){
											%>
											<span class="quick_item_discount"><%=percent %></span>
											<span class="quick_item_discountprice"><del><%=NumberFormat.getInstance().format(item.getI_price())%>-></del></span>	
										<%
										}
										%>
										<span><%=NumberFormat.getInstance().format(price) %></span>
									</td>
								</tr>
								<tr class="quick_item_size">
									<td>
										<span class="quick_item_size_icon"><%=item.getI_size()%></span>
										<span class="quick_item_size_letter">size</span>
										<span class="quick_item_free">무료배송</span>
									</td>
								</tr>
							</tbody>
						<%
						} 
					}
					%>
				</table>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="../inc/footer.jsp"></jsp:include>
		<!-- footer -->
	</body>
</html>