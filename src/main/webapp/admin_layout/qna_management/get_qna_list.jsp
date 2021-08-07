<%@page import="vo.PageInfo"%>
<%@page import="vo.QnaBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<QnaBean> qnaList = (ArrayList<QnaBean>)request.getAttribute("qnaList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	int currentPage = pageInfo.getPage();
	int listCount = pageInfo.getListCount();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
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
<section id="pageList">
	<% if(maxPage != 1){
		if(currentPage <= 1) {%>
				<input class="page_btn" type="button" value="<<">&nbsp;
		<%} else {%>
				<input class="page_btn" type="button" value="<<" onclick="location.href='QnaList.ad?page=<%=currentPage - 1 %>'">&nbsp;
		<%} %>
		
		<%for(int i = startPage; i <= endPage; i++) { 
				if(i == currentPage) { %>
					<span id="selected_page_num"><%="  "+ i + "  " %></span>
			<%} else {%>
			<a id="page_num" href="QnaList.ad?page=<%=i %>"><%="  "+ i + "  " %></a>&nbsp;
			<%} %>
		<%} %>
		
		<%if(currentPage >= maxPage) {%>
			<input class="page_btn" type="button" value=">>">
		<%} else { %>
			<input class="page_btn" type="button" value=">>" onclick="location.href='QnaList.ad?page=<%=currentPage + 1 %>'">
		<% } 
	}%>
</section>
