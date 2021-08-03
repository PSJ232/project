<%@page import="vo.QnaBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<QnaBean> qnaList = (ArrayList<QnaBean>)request.getAttribute("qnaList");
%>
<table class="table" border="1">
	<tr><th>순번</th><th>작성자</th><th>제목</th><th>작성일시</th><th>상태</th></tr>
	<%
	String subject = "";
		for(QnaBean qna: qnaList){
			if(qna.getQ_re_lev() == 1){
				subject = "&emsp;"+qna.getQ_subject();
			}else {
				subject = qna.getQ_subject();
			}
			%>
			<tr>
			<td width="50"><%=qna.getQ_id()%></td>
			<td width="150"><%=qna.getM_id()%></td>
			<td width="300" align="left"><a href="QnaDetail.ad?q_id=<%=qna.getQ_id()%>"><%=subject%></a></td>
			<td width="150"><%=qna.getQ_rdate()%></td>
			<% if(qna.getQ_answered() == 0){
				%><td width="100">미답변</td><%
			}else {
				%><td width="100">답변완료</td><%
			}
			%>
			</tr>
			<%
		}
	%>
</table>