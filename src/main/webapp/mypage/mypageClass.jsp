<%@page import="vo.MemberBean"%>
<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>mypageClass.jsp</h1>
<%
MemberBean memberMypageDetail = (MemberBean)request.getAttribute("memberMypageDetail");
ArrayList<ClassBean> classStartList = (ArrayList<ClassBean>)request.getAttribute("classStartList");
ArrayList<ClassBean> classEndList = (ArrayList<ClassBean>)request.getAttribute("classEndList");

%>

<table>
<tr><td>신청 일자</td><td>클래스 정보</td><td>결제 상태</td></tr>

</table>



</body>
</html>