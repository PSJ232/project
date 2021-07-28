<%@page import="vo.AnniversaryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if (request.getAttribute("annDetail") == null) {%>
	<h1>기념일 등록하기</h1>
	<hr>
	<form action="MemberAnnInsertPro.me" method="post">
		기념일* <input type="text" name="a_date" placeholder="날짜를 선택해주세요.">(클릭하면 달력뜨도록 가능?)<br>
		기념일 이름* <input type="text" name="a_name" placeholder="기념일 명을 입력해주세요."><br>	
		반복 주기*
		<select name="a_repeat" size="1" >
			<option value="0" selected>없음</option>
			<option value="1">매년</option>
			<option value="100">100일마다</option>
		</select>
		<br>
		<input type="submit" value="등록하기">
	</form>
	<%} else {
	AnniversaryBean annDetail = (AnniversaryBean) request.getAttribute("annDetail");
	%>
	<h1>기념일 수정하기</h1>
	<hr>
	<form action="MemberAnnUpdatePro.me" method="post">
		기념일* <input type="text" name="a_date" value="<%=annDetail.getA_date()%>">(클릭하면 달력뜨도록 가능?)<br>
		기념일 이름* <input type="text" name="a_name" value="<%=annDetail.getA_name()%>"><br>	
		반복 주기*
		<select name="a_repeat" >
			<option value="0" <%if(annDetail.getA_repeat()==0){%>selected<%}%>>없음</option>
			<option value="1" <%if(annDetail.getA_repeat()==1){%>selected<%}%>>매년</option>
			<option value="100" <%if(annDetail.getA_repeat()==100){%>selected<%}%>>100일마다</option>
		</select>
		<br>
		
		<input type="hidden" name="a_id" value="<%=annDetail.getA_id()%>">
		<input type="submit" value="수정하기">
	</form>
	<%
	}
	%>
</body>
</html>