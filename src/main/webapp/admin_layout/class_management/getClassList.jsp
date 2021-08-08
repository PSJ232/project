<%@page import="vo.ClassDetailBean"%>
<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ClassBean> classList = (ArrayList<ClassBean>)request.getAttribute("classList");
	ArrayList<ClassDetailBean> classDetailList = (ArrayList<ClassDetailBean>)request.getAttribute("classDetailList");
%>    
	<%
			for(ClassBean cb : classList){
				%>
				<table class="class_content">
				<tr>
				<td rowspan="4" width="5"><img id="img" src="./admin_layout/upload/<%=cb.getClass_main_img() %>"/></td>
				<td width="500"><h1 ><a id="class_subject" href="ClassDetailView.ad?class_num=<%=cb.getClass_id()%>"><%=cb.getClass_subject() %></a></h1></td>
				</tr>
				<tr>
				<td height="100">
				<h2><%=cb.getClass_place() %></h2>
				<%
			for(ClassDetailBean cdb: classDetailList){
				if(cb.getClass_id() == cdb.getClass_id()){
					%>
						<%=cdb.getTime() %>:00:00<br>
					<%
					} 
				}
				%>
				</td>
				</tr>
				<tr><td>정원: <%=cb.getClass_max_member() %>명</td></tr>
				<tr><td> 클래스날짜: <%=cb.getClass_date() %></td></tr>
				</table>
				<%
			}
	%>
	<input type="button" value="클래스 등록" id="btn" onclick="location.href='ClassInsertForm.ad'">
