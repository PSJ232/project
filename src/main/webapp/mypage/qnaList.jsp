<%@page import="java.sql.Date"%>
<%@page import="vo.QnaBean"%>
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
<a href="QnaInsert.qna">1:1 문의하기</a>
<%
ArrayList<QnaBean> qnaList = (ArrayList<QnaBean>) request.getAttribute("qnaList");
String m_id = (String)session.getAttribute("m_id");
int q_id = Integer.parseInt(request.getParameter("q_id"));
%>
<form action="QnaList.qna" method="post">
<input type="hidden" name="m_id" value="<%=m_id %>">
<input type="hidden" name="q_id" value="<%=q_id %>">
<table border="1">
	<tr>
	<td>작성일</td>
	<td>제목</td>
	<td>내용</td>
	</tr>
	<%
		for(int i=0; i < qnaList.size(); i++) {
		Date q_rdate = qnaList.get(i).getQ_rdate();
		String q_subject = qnaList.get(i).getQ_subject();
		String q_content = qnaList.get(i).getQ_content();
		%>
	<tr>
	<td><%=q_rdate %></td>
	<td><%=q_subject %></td>
	<td><%=q_content %></td>
	</tr>
	</table>
	</form>
		<%
	}
	%>
	

</body>
</html>