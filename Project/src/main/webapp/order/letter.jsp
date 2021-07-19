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
// 신종현 할일. 단일 상품일때 해결책 생각하기 (다중상품은 해결됨)




%>
<body>
	주문/결제<br>

	편지 작성<br><br><br><br>

	<form action="OrderForm.od" method="post">
		<%
		ItemDetailService itemDetailService = new ItemDetailService();
		ItemBean ib = null;
		int i = 0; // for문 돌때 각각의 주문구분번호 부여
		for(CartBean cb : cartList) { // ArrayList에 든 CartBean 하나씩 꺼내기
			i++; // 1~N수
			ib = itemDetailService.selectItem(cb.getI_id()); // 꺼낸 CartBean의 i_id로 itemDetail 호출
			if(cb.getC_letter() == 1){
		%>		

				상품이미지<%=ib.getI_img() %><br>
				<%=ib.getI_name() %><br>
				수령일: <%=cb.getC_delivery_date() %><br>
				추가상품:편지<br>
	
				<input type="radio" name="l_id<%=i %>" value=1>감사 
				<input type="radio" name="l_id<%=i %>" value=2>응원 
				<input type="radio" name="l_id<%=i %>" value=3>사랑 
				<input type="radio" name="l_id<%=i %>" value=4 checked>직접쓰기<input type="text" name="od_message<%=i %>" placeholder="내용을 입력해주세요 :)">
				
				<input type="hidden" name="c_id<%=i %>" value="<%=cb.getC_id()%>">
				<input type="hidden" name="i_id<%=i %>" value="<%=ib.getI_id()%>">
				<input type="hidden" name="c_qty<%=i %>" value="<%=cb.getC_qty()%>">
				<input type="hidden" name="iNum" value="<%=i %>"> <!-- 주문페이지에서 getParameter를 몇번 반복할지 참조가 되는 값 -->
				
				<br><br><br>
		
		<%	
			}
		}
		%>	
	
		- 최대8줄, 한줄당 최대 20자까지 인쇄됩니다.(공백포함)
		- 이모티콘은 편지 내용에 포함되지않습니다.
		- 붙여넣기 사용시 편지가 입력 되지 않습니다.
		<br>
		
		
		<input type="submit" value="작성완료">
	</form>



</body>
</html>