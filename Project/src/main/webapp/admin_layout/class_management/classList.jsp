<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ClassBean> classList = (ArrayList<ClassBean>)request.getAttribute("classList");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<body>
	<header>
		<jsp:include page="../inc/adminHeader.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="../inc/navigation.jsp"></jsp:include>
	</nav>
	<div id="container"> <!-- css layout요소 추가 -->
		<h1>Class List</h1>
		<table border="1">
			<tr><th>id</th><th>subject</th><th>desc</th><th>price</th><th>maxmem</th><th>date</th><th>main_img</th><th>sub_img1</th><th>sub_img2</th><th>sub_img3</th></tr>
		<%
			for(ClassBean cb : classList){
				%><tr><td><%=cb.getClass_id() %></td>
				<td><%=cb.getClass_subject() %></td>
				<td><%=cb.getClass_desc() %></td>
				<td><%=cb.getClass_price() %></td>
				<td><%=cb.getClass_max_member() %></td>
				<td><%=cb.getClass_create_date() %></td>
				<td><%=cb.getClass_main_img() %></td>
				<td><%=cb.getClass_sub_img1() %></td>
				<td><%=cb.getClass_sub_img2() %></td>
				<td><%=cb.getClass_sub_img3() %></td>
				</tr><%
			}
		%>
		</table>
		<input type="button" value="클래스 등록" onclick="location.href='ClassInsertForm.ad'">
		<input type="button" value="클래스 삭제" onclick="location.href='ClassDeletePro.ad'">
	</div>
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>