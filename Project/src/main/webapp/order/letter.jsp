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
ArrayList<CartBean> checkList = (ArrayList<CartBean>) request.getAttribute("checkList"); //장바구니에서 가져온 목록
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList"); //장바구니에 담긴 아이템의 목록(위 장바구니 ArrayList와 순서동일)
%>
<body>
	주문/결제<br>

	편지 작성(<%=request.getParameter("letterCount") %>)<br><br><br><br>

	<form action="OrderLetter.od" method="post">
		<%
		int i; // for문 돌때 각각의 주문구분번호 부여
		for(i = 0; i < checkList.size(); i++) { // 장바구니와 아이템의 ArrayList에서 필요 정보 반복 추출
			String i_img = itemList.get(i).getI_img(); //상품 이미지
			String i_name = itemList.get(i).getI_name(); //상품 이름
			String delivery_date = checkList.get(i).getC_delivery_date(); //상품 배송 요청일
			int c_letter = checkList.get(i).getC_letter(); //편지지 선택 여부
			int i_id = itemList.get(i).getI_id(); //상품 번호
			int c_qty = checkList.get(i).getC_qty(); //상품 수량
			int c_id = checkList.get(i).getC_id(); //장바구니 번호
			
			
			if(c_letter == 1){ //편지 선택함
		%>		
				상품이미지<%=i_img %><br>
				<%=i_name %><br>
				수령일: <%=delivery_date %><br>
				추가상품:편지<br>
	
				<input type="radio" name="l_id<%=i %>" value=1>감사 
				<input type="radio" name="l_id<%=i %>" value=2>응원 
				<input type="radio" name="l_id<%=i %>" value=3>사랑 
				<input type="radio" name="l_id<%=i %>" value=4 checked>직접쓰기
				<input type="text" name="od_message<%=i %>" placeholder="내용을 입력해주세요 :)">
				
				<input type="hidden" name="c_id<%=i %>" value="<%=c_id%>">
				<input type="hidden" name="i_id<%=i %>" value="<%=i_id%>">
				<input type="hidden" name="c_qty<%=i %>" value="<%=c_qty%>">
				
				<br><br><br>
		<%} else { //편지 선택안함 %> 
				
				<input type="hidden" name="l_id<%=i %>" value="0"> <!-- 선택안함기본값 -->
				<input type="hidden" name="c_id<%=i %>" value="<%=c_id%>">
				<input type="hidden" name="i_id<%=i %>" value="<%=i_id%>">
				<input type="hidden" name="c_qty<%=i %>" value="<%=c_qty%>">
				
				
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