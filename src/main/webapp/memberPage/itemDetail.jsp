<%@page import="java.text.NumberFormat"%>
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
<script type="text/javascript">
	function isLetter(price, num) {
		if(num==0){
			document.getElementById('letter').innerHTML = "";
			document.getElementById('totalPrice').innerHTML = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		} else {
			document.getElementById('letter').innerHTML = "추가상품 : 편지지추가 2,500원<br>";
			document.getElementById('totalPrice').innerHTML =  (price+2500).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	}

</script>
<%
ItemBean itemDetail = (ItemBean)request.getAttribute("itemDetail");
ArrayList<ReviewBean> rbList = (ArrayList<ReviewBean>)request.getAttribute("rbList");
// review null 값 처리해야됨
int i_id = Integer.parseInt(request.getParameter("i_id"));
float i_discount = itemDetail.getI_discount();
int i_price = itemDetail.getI_price();
String i_name = itemDetail.getI_name();
int price = (int)(i_price*i_discount/100)*100;

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
	<%=i_name %><br>
	<%=(int)((1-i_discount)*100) %>% <%=NumberFormat.getInstance().format(i_price) %>원 -> <%=NumberFormat.getInstance().format(price) %>원<br>
	<hr>
	3만원 이상 구매시, 무료배송!<br>
	서울/경기/인천 일부지역은 새벽배송으로 신선하게 배송됩니다.
	<hr>
	<form method="post" name="order">
		<input type="hidden" name="i_id" value=<%=i_id %>>
		수령일<input type="date" name="c_delivery_date" required><br>
		수량<input type="number" name="c_qty" value="1" required><br>
		편지 추가<input type="radio" name="c_letter" value="1" onclick="isLetter(<%=price %>, 1)" checked>추가할게요(2,500원)
				<input type="radio" name="c_letter" value="0" onclick="isLetter(<%=price %>, 0)">추가하지 않을게요<br>
		<br>
		상품가격 <%=NumberFormat.getInstance().format(price) %><br>
		<span id="letter">추가상품 : 편지지추가 2,500원<br></span>
		(무료배송)<br>
		총주문금액 <span id="totalPrice"><%=NumberFormat.getInstance().format(price+2500) %></span><br>
		<br>
		<%if(session.getAttribute("m_id") == null){%>
			<input type="submit" value="장바구니(비회원)" onclick="javascript:form.action='VisitorCart.cr'"> 
			<input type="submit" value="바로구매(비회원)" onclick="javascript:form.action='VisitorOrderCart.od'">
		<%}else{%>
		<input type="submit" value="장바구니" onclick="javascript:form.action='CartInsertPro.cr'"> 
		<input type="submit" value="바로구매" onclick="javascript:form.action='OrderNow.od'"> 
		<%}%>
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












