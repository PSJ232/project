<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String> placeList = (ArrayList<String>)request.getAttribute("placeList");

	for(String place: placeList){
		%><li><a href="#"><%=place %></a></li><%
	}
%>
