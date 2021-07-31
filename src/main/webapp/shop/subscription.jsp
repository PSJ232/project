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
ItemBean sizeS = null;
ItemBean sizeM = null;
ItemBean sizeL = null;
ItemBean sizeXL = null;
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList");
for(ItemBean ib : itemList) {
	if(ib.getI_category() == 3){
		switch(ib.getI_size()){
		case "S" : sizeS = ib; break;
		case "M" : sizeM = ib; break;
		case "L" : sizeL = ib; break;
		case "XL" : sizeXL = ib; break;
		}
	}
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


꾸까 꽃 정기구독<br>
2주에 한번, 매번 새로운 꽃으로 당신의 일상을 행복으로 채울게요<br>
 
 <h3>정기구독 상품</h3>
	<table>
		<tbody>
			<tr><td><a href="SubContent.shop?i_id=<%=sizeS.getI_id() %>">
					<img src="../admin_layout/upload/<%=sizeS.getI_img() %>"></a></td></tr>
			<tr><td><%=sizeS.getI_desc() %></td></tr>
			<tr><td><a href="SubContent.shop?i_id=<%=sizeS.getI_id() %>"><%=sizeS.getI_name() %></a></td></tr>
			<tr><td><%=NumberFormat.getInstance().format(sizeS.getI_price()) %>~</td></tr>
			<tr>
				<td>
					2주에 한번, 꽃이 일상이 되는 가벼운 시작<br>
					작지만 그 계절 가장 예쁜 꽃으로 만들었어요.<br>
					나에게, 사랑하는 사람에게 작은 꽃다발이 주는 행복을 전해보세요.<br>
				</td>
			</tr>
			<tr><td>무료배송</td></tr>
		</tbody>
		<tbody>
			<tr><td><a href="SubContent.shop?i_id=<%=sizeM.getI_id() %>">
					<img src="../admin_layout/upload/<%=sizeM.getI_img() %>"></a></td></tr>
			<tr><td><%=sizeM.getI_desc() %></td></tr>
			<tr><td><a href="SubContent.shop?i_id=<%=sizeM.getI_id() %>"><%=sizeM.getI_name() %></a></td></tr>
			<tr><td><%=NumberFormat.getInstance().format(sizeM.getI_price()) %>~</td></tr>
			<tr>
				<td>
					2주에 한번, 내 공간이 꽃이 되는 좋은 시작<br>
					한 손에 가득 차는 꽃다발로 그 계절 가장 예쁜 꽃을 담았어요.<br>
					책상 위, 침대 옆에 두고 더욱 커지는 일상의 행복을 느껴보세요.<br>
				</td>
			</tr>
			<tr><td>무료배송</td></tr>
		</tbody>
		<tbody>
			<tr><td><a href="SubContent.shop?i_id=<%=sizeL.getI_id() %>">
					<img src="../admin_layout/upload/<%=sizeL.getI_img() %>"></a></td></tr>
			<tr><td><%=sizeL.getI_desc() %></td></tr>
			<tr><td><a href="SubContent.shop?i_id=<%=sizeL.getI_id() %>"><%=sizeL.getI_name() %></a></td></tr>
			<tr><td><%=NumberFormat.getInstance().format(sizeL.getI_price()) %>~</td></tr>
			<tr>
				<td>
					2주에 한번, 꽃이 일상이 되는 가벼운 시작<br>
					작지만 그 계절 가장 예쁜 꽃으로 만들었어요.<br>
					나에게, 사랑하는 사람에게 작은 꽃다발이 주는 행복을 전해보세요.<br>
				</td>
			</tr>
			<tr><td>무료배송</td></tr>
		</tbody>
		<tbody>
			<tr><td><a href="SubContent.shop?i_id=<%=sizeXL.getI_id() %>">
					<img src="../admin_layout/upload/<%=sizeXL.getI_img() %>"></a></td></tr>
			<tr><td><%=sizeXL.getI_desc() %></td></tr>
			<tr><td><a href="SubContent.shop?i_id=<%=sizeXL.getI_id() %>"><%=sizeXL.getI_name() %></a></td></tr>
			<tr><td><%=NumberFormat.getInstance().format(sizeXL.getI_price()) %>~</td></tr>
			<tr>
				<td>
					2주에 한번, 꽃으로 가득차는 일상의 행복<br>
					한 아름 안을 수 있는 꽃다발로 그 계절 가장 예쁜 꽃을 가득 담았어요.<br>
					이 꽃다발 하나라면 모두의 행복을 가득 채울 수 있어요.<br>
				</td>
			</tr>
			<tr><td>무료배송</td></tr>
		</tbody>
	</table>
	
	<h3>이용 방법</h3>
	01
	정기구독 상품 중 원하시는 꽃 사이즈를 선택해 주세요.
	02
	꽃을 구독하고 싶은 총 기간을 선택해 주세요.
	03
	꽃을 받고 싶은 요일을 선택해주세요.
	04
	2주에 한번 그 계절 가장 이쁜 꽃으로 찾아갈게요.
	
	!혹시, 일정을 변경하고 싶으신가요? 마이페이지 혹은 고객센터를 통해 미리 일정을 변경하실 수 있습니다.
	

	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>