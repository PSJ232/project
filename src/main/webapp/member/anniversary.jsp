<%@page import="vo.AnniversaryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>기념일 등록하기</title>
<link rel="stylesheet" href="css/join.css" type="text/css" />
<link rel="stylesheet" href="css/anniversary.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
	<div class="anniversaryForm">
		<%if (request.getAttribute("annDetail") == null) {%>
			<div class="title"><h1>기념일 등록하기</h1></div>	
			<hr>
			<form action="MemberAnnInsertPro.me" class="formAnniversary" method="post">
				<div class="row"><label class="leftLabel">기념일<span class="textStar">*</span></label> <input type="text" class="textBox" name="a_date" placeholder="날짜를 선택해주세요."><!-- (클릭하면 달력뜨도록 가능?) --></div>
				<div class="row"><label class="leftLabel">기념일 이름<span class="textStar">*</span></label><input type="text" class="textBox"name="a_name" placeholder="기념일 명을 입력해주세요."></div>
				<div class="row"><label class="leftLabel">반복 주기<span class="textStar">*</span></label>
				<select name="a_repeat" size="1"  class="annSelect" >
					<option value="0" selected>없음</option>
					<option value="1">매년</option>
					<option value="100">100일마다</option>
				</select></div>
				<br>
				<input type="submit" value="등록하기">
			</form>
		<%} else {
		AnniversaryBean annDetail = (AnniversaryBean) request.getAttribute("annDetail");
		%>
			<div class="title"><h1>기념일 수정하기</h1></div>
			<hr>
			<form action="MemberAnnUpdatePro.me" class="formAnniversary" method="post">
				<div class="row"><label class="leftLabel">기념일<span class="textStar">*</span></label> <input type="text" class="textBox" name="a_date" value="<%=annDetail.getA_date()%>"><!-- 클릭하면 달력뜨도록 가능?)--><br></div>
				<div class="row"><label class="leftLabel">기념일 이름<span class="textStar">*</span></label><input type="text" class="textBox" name="a_name" value="<%=annDetail.getA_name()%>"><br></div>	
				<div class="row"><label class="leftLabel">반복 주기<span class="textStar">*</span></label>
				<select name="a_repeat" size="1" class="annSelect" >
					<option value="0" <%if(annDetail.getA_repeat()==0){%>selected<%}%>>없음</option>
					<option value="1" <%if(annDetail.getA_repeat()==1){%>selected<%}%>>매년</option>
					<option value="100" <%if(annDetail.getA_repeat()==100){%>selected<%}%>>100일마다</option>
				</select></div>
				<br>
			
			<input type="hidden" name="a_id" value="<%=annDetail.getA_id()%>">
			<input type="submit" value="수정하기">
		</form>
		<%
		}
		%>
	</div>
</body>
</html>