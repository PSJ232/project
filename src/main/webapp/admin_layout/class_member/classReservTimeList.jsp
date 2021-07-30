<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<Integer> timeList = (ArrayList<Integer>) request.getAttribute("reservTimeList");
	for(int time : timeList) {
		System.out.print(time);
		%>
		<%=time%>
		<%
	}%>
