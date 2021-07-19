<%@page import="vo.ClassDetailBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ClassDetailBean> classDetailList = (ArrayList<ClassDetailBean>)request.getAttribute("classDetailList");
	System.out.println(request.getParameter("class_num"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	for(ClassDetailBean i:classDetailList){
		%><h4><%=i.getTime() %></h4><%
	}
%>
</body>
</html> 