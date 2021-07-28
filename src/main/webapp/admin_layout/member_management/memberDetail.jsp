<%@page import="vo.DetailBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");
	ArrayList<DetailBean> orderList = (ArrayList<DetailBean>)request.getAttribute("orderList");
	ArrayList<DetailBean> reviewList = (ArrayList<DetailBean>)request.getAttribute("reviewList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 멤버상세</title>
<style>
	.review {
		float: right;
	}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function(){
		
	});
</script>
<script type="text/javascript">
	var request = new XMLHttpRequest();
	function getContent(r_id, value){
		if(!document.getElementById('content_'+r_id)){
			
			var value_idx = $(value).index();
			request.open("Post", "http://localhost:8080/project/getReviewContent.ad?r_id=" + encodeURIComponent(r_id) , true);
			request.onreadystatechange = function(){
				var table = document.getElementById("reviewList");
				if(request.readyState == 4 && request.status == 200){
					var object = eval('('+request.responseText+')'); 
					var result = object.result;
					var row = table.insertRow(value_idx + 1);
					row.innerHTML = "<td id=content_" + r_id + " colspan='4'>" + result[0].value + "</td>";
				}
			};
			request.send(null);
			
		}else{
			document.getElementById('content_'+r_id).parentNode.remove();
		}
	}
</script>
</head>
<body>
<h1>회원상세정보</h1>
회원아이디: <%=memberBean.getM_id()%><br>
회원이름: <%=memberBean.getM_name()%><br>
회원전화번호: <%=memberBean.getM_phone()%><br>
회원생일: <%=memberBean.getM_birth()%><br>
회원성별: <%=memberBean.getM_gender()%><br>
회원등급: <%=memberBean.getG_id()%><br>
마케팅 동의여부: <%=memberBean.getM_agree()%><br>
가입날짜: <%=memberBean.getM_rdate()%><br>
포인트: <%=memberBean.getM_point()%><br>
<%
if(memberBean.getM_drop() != null){
%>탈퇴날짜: <%=memberBean.getM_drop()%><%
}
%><br>

<h1>회원 주문 기록</h1>
<table id="orderList" border="1">
	<tr>
		<th>주문번호</th>
		<th>주문자ID</th>
		<th>주문상품</th>
		<th>주문금액</th>
		<th>주문일시</th>
		<th>배송상태</th>
	</tr>
	<%
	for(DetailBean order: orderList){
	%>
			<tr>
			<td><a href='OrderDetail.ad?o_id=<%=order.getO_id() %>'><%=order.getO_id() %></a></td>
			<td><%=order.getM_id() %></td>
			<td><%=order.getI_name() %></td>
			<td><%=order.getO_amount() %></td>
			<td><%=order.getO_rdate() %></td>
			<td><%=order.getOd_invoice() %></td>
			</tr>
			<%
		}
	%>
</table>
<div class="review">
	<h1>회원 리뷰 목록</h1>
	<table id="reviewList" border="1">
		<tr>
			<th>순번</th>
			<th>작성일시</th>
			<th>제목</th>
			<th>평점</th>
		</tr>
		<%
			for(int i = 0; i < reviewList.size(); i++){
				%>
				<tr id="showContent" onclick="getContent(<%=reviewList.get(i).getR_id()%>,this)">
					<td><%=i+1 %></td>
					<td><%=reviewList.get(i).getR_rdate() %></td>
					<td><%=reviewList.get(i).getR_title() %></td>
					<td>
					<%
					for(int j=0; j < reviewList.get(i).getR_rate(); j++){
						%>★<%
					}
					%>
					</td>
				</tr>
				<%
			}
		%>
	</table>
</div>
</body>
</html>