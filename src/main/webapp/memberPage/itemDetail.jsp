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












