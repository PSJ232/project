<%@page import="java.sql.Time"%>
<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ClassBean classBean = (ClassBean)request.getAttribute("classBean");
	ArrayList<Time> timeList = (ArrayList<Time>)request.getAttribute("timeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src="<%=classBean.getClass_main_img()%>">
	<h3><%=classBean.getClass_subject() %></h3>
	<h4><%=classBean.getClass_desc() %></h4>
	<h4>장소: <%=classBean.getClass_place()%></h4>
	<h4>가격:	<%=classBean.getClass_price() %></h4>
	<span>정원: <%=classBean.getClass_max_member() %></span>
	<span>현재인원: <%=classBean.getClass_current_member() %></span>
	<span>게시일자: <%=classBean.getClass_create_date() %></span>
	<span>클래스일자: <%=classBean.getClass_date() %></span>
	<span>조회수: <%=classBean.getClass_readcount() %></span>
	<input type="button" name="listBtn" value="목록">
	<input type="button" name="modifyBtn" value="수정" onclick="location.href='ClassModifyForm.ad?class_num=<%=classBean.getClass_id()%>'">
</body>
</html> 