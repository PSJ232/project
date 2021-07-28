<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
ItemBean itemDetail = (ItemBean)request.getAttribute("itemDetail");
ArrayList<ReviewBean> rbList = (ArrayList<ReviewBean>)request.getAttribute("rbList");
// review null 값 처리해야됨

int i_id = Integer.parseInt(request.getParameter("i_id"));
%>
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<body>
  <!-- header -->
  	<jsp:include page="../inc/adminHeader.jsp" ></jsp:include>
  <!-- header -->
	
	<!-- review -->
	<h5>아이템 관련</h5>
	<%=itemDetail.getI_name() %>
	<br>
	<form method="post" name="order">
		<input type="hidden" name="i_id" value=<%=i_id %>>
		수량<input type="number" name="c_qty" required><br>
		편지추가<input type="radio" name="c_letter" value="1" checked>추가할게요(2,500원)<input type="radio" name="c_letter" value="0">추가하지 않을게요<br>
		배달요청일<input type="date" name="c_delivery_date" required><br>
		<input type="submit" value="장바구니" onclick="javascript:form.action='CartInsertPro.cr'"> 
		<input type="submit" value="바로구매" onclick="javascript:form.action='OrderNow.od'"> 
	</form>
		
	
		
		
		
		
	<h5>리뷰리스트</h5>
	<table border="1">
	<tr><td>별점</td><td>제목</td><td>작성자</td><td>주문일자</td></tr>
	
	<%
		System.out.println(rbList.size());
		for(int i=0; i<rbList.size(); i++) {%>
			<tr><td><%=rbList.get(i).getR_rate() %></td><td><%=rbList.get(i).getR_title() %></td><td><%=rbList.get(i).getR_writer() %></td><td><%=rbList.get(i).getR_rdate() %></td></tr>
		<%
		} 
	%>
	
	</table>
	
	
	
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>












