<%@page import="vo.QnaBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QnaBean qnaBean = (QnaBean)request.getAttribute("qnaBean");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/admin.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/list_style.css">
<style type="text/css">
	.container input[type=text], textarea{
		font-size: 15px;
		border: none;
		outline: none;
		margin-bottom: 20px;
		border: 1px solid #ccc;
		padding: 10px;
		border-radius: 5px;
		width: 500px;
	}
	.container label {
		width: 200px;
		font-size: 17px;
		float:left;
	}
	.container {
		width: 700px;
	}
	#title {
		margin-bottom: 30px;
	}
	.btn {
		float:right;
	}
	.btn:hover {
		background-color: #FFCD12;
		cursor: pointer;
	}
</style>
</head>
<body>
<!-- 	<header> -->
	<jsp:include page="/inc/adminHeader.jsp"></jsp:include>
<!-- 	</header> -->
<!-- 	<nav> -->
	<jsp:include page="/inc/navigation.jsp"></jsp:include>
<!-- 	</nav> -->
	<div class="container">
		<form action="WriteAnswerPro.ad" method="POST">
			<h1 id="title">답변등록</h1>
			<label>ID</label><input type="text" name="m_id" value="admin@admin.com" readonly><br>
			<label>주문번호</label><input type="text" name="o_id" value="<%=qnaBean.getO_id() %>" readonly><br>
			<label>제목</label><input type="text" name="q_subject" value="ANSWER: <%=qnaBean.getQ_subject() %>"><br>
			<label>내용</label><textarea name="q_content" rows="20" cols="70"></textarea><br>
			<input type="hidden" name="q_id" value="<%=qnaBean.getQ_id() %>">
			<input type="submit" class="btn" value="작성" onclick="location.href='AnswerWritePro.ad'">
			<input type="button" class="btn" value="목록" onclick="location.href='QnaList.ad'">
		</form>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>