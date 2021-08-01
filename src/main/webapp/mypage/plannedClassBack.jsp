<%@page import="vo.MyClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<MyClassBean> plannedClassList = (ArrayList<MyClassBean>)request.getAttribute("plannedClassList");
%>

<%
	for(MyClassBean mcb: plannedClassList){
		%>
		<tr>
			<td><%=mcb.getReserv_date()%></td>
			<td class="myclass_info_box">
				<div>
					<h4><%=mcb.getSubject()%></h4>
					<span class="myclass_place"><%=mcb.getPlace()%></span>
				</div>
				<div>
					<span><%=mcb.getClass_date()%></span>
					<span><%=mcb.getTime()%>시</span>
				</div>
				<span>인원: <%=mcb.getNum()%>명</span>
				<span>가격: <%=mcb.getPrice()%>원</span>
			</td>
		</tr>	
		<%
	}
%>
