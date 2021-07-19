<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
int i_id = Integer.parseInt(request.getParameter("i_id"));
int od_qty = Integer.parseInt(request.getParameter("od_qty"));

%>
<body>
주문/결제<br>

편지 작성(//편지지수량)<br>

//상품이미지표시<br>
//상품명표시<br>
수령일: //선택수령일표시<br>
추가상품:편지<br>
<form action="OrderForm.od" method="post">
	<input type="radio" name="l_id" value=1>감사 
	<input type="radio" name="l_id" value=2>응원 
	<input type="radio" name="l_id" value=3>사랑 
	<input type="radio" class="message" name="l_id" value=4>직접쓰기<input type="text" name="od_message" placeholder="내용을 입력해주세요 :)"><br><br><br>
	
	(테스트는 상품페이지에서 상품번호001과 갯수1개, 편지지추가 를 선택하고 주문을 진행했을때를 가정)<br>
	
	
	
	- 최대8줄, 한줄당 최대 20자까지 인쇄됩니다.(공백포함)
	- 이모티콘은 편지 내용에 포함되지않습니다.
	- 붙여넣기 사용시 편지가 입력 되지 않습니다.
	<input type="hidden" name="i_id" value="<%=i_id%>">
	<input type="hidden" name="od_qty" value="<%=od_qty%>">
	<input type="submit" value="작성완료">
</form>



</body>
</html>