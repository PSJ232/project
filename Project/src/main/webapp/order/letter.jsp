<%@page import="vo.ItemBean"%>
<%@page import="svc.ItemDetailService"%>
<%@page import="vo.CartBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
ArrayList<CartBean> cartList = (ArrayList<CartBean>) request.getAttribute("cartList");
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList");
// 신종현 할일. 단일 상품일때 해결책 생각하기 (다중상품은 해결됨)


%>
<body>
	주문/결제<br>

	편지 작성<br><br><br><br>

	<form action="OrderForm.od" method="post">
		<%
		int i; // for문 돌때 각각의 주문구분번호 부여
		for(i = 0; i < cartList.size(); i++) {
			String i_img = cartList.get(i).getC_delivery_date();
			String i_name = itemList.get(i).getI_img();
			String delivery_date = itemList.get(i).getI_name();
			int c_letter = cartList.get(i).getC_letter();
			int c_id = cartList.get(i).getC_id();
			int i_id = itemList.get(i).getI_id();
			int c_qty = cartList.get(i).getC_qty();
			
			if(c_letter == 1){
		%>		

				상품이미지<%=i_img %><br>
				<%=i_name %><br>
				수령일: <%=delivery_date %><br>
				추가상품:편지<br>
	
				<input type="radio" name="l_id<%=i %>" value=1>감사 
				<input type="radio" name="l_id<%=i %>" value=2>응원 
				<input type="radio" name="l_id<%=i %>" value=3>사랑 
				<input type="radio" name="l_id<%=i %>" value=4 checked>직접쓰기<input type="text" name="od_message<%=i %>" placeholder="내용을 입력해주세요 :)">
				
				<input type="hidden" name="c_id<%=i %>" value="<%=c_id%>">
				<input type="hidden" name="i_id<%=i %>" value="<%=i_id%>">
				<input type="hidden" name="c_qty<%=i %>" value="<%=c_qty%>">
				
				<br><br><br>
		
		<%	
			}
		}
		%>	
	
		- 최대8줄, 한줄당 최대 20자까지 인쇄됩니다.(공백포함)
		- 이모티콘은 편지 내용에 포함되지않습니다.
		- 붙여넣기 사용시 편지가 입력 되지 않습니다.
		<br>
		
		
		<input type="hidden" name="iNum" value="<%=i %>"> <!-- 주문페이지에서 getParameter를 몇번 반복할지 참조가 되는 값 -->
		<input type="submit" value="작성완료">
	</form>



</body>
</html>