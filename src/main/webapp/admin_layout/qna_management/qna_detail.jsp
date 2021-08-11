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
<title>관리자 | 문의상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/admin.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/list_style.css">
<link rel="stylesheet" href="./css/admin_qna.css">
<script>
	$(document).ready(function(){
		$('.admin_header_subtitle').text("문의상세");
	});
	function deleteAnswer(){
		var result = confirm("삭제하시겠습니까?");
		if(result == true){
			location.href="DeleteQna.ad?q_id=<%=qnaBean.getQ_id() %>&q_re_ref=<%=qnaBean.getQ_re_ref()%>";
		}
		
	}
</script>
</head>
<body>
	<!-- 	<header> -->
	<jsp:include page="/inc/adminHeader.jsp"></jsp:include>
<!-- 	</header> -->
<!-- 	<nav> -->
	<jsp:include page="/inc/navigation.jsp"></jsp:include>
<!-- 	</nav> -->
	<div class="container qna_text_center">
		<div class="qna_detail_layout">
			<h1 id="title">문의상세</h1>
			<label>ID</label><input type="text" value="<%=qnaBean.getM_id() %>" readonly><br>
			<label>주문번호</label><a href="OrderDetail.ad?o_id=<%=qnaBean.getO_id() %>"><input type="text" value="<%=qnaBean.getO_id() %>" readonly></a><br>
			<label>제목</label><input type="text" value="<%=qnaBean.getQ_subject() %>" readonly><br>
			<label>내용</label><textarea rows="20" cols="70" readonly><%=qnaBean.getQ_content() %></textarea><br>
			<label>첨부파일1</label>
			<%
				if(qnaBean.getQ_img() != null){
					%><a href="./boardUpload/<%=qnaBean.getQ_img() %>" download="<%=qnaBean.getQ_img() %>"><input class="link" type="text" value="<%=qnaBean.getQ_img() %>" readonly></a><br><%
				}else{
					%><input type="text" value="" readonly><br><%
				}
			%>
			<label>첨부파일2</label>
			<%
				if(qnaBean.getQ_img2() != null){
					%><a href="./boardUpload/<%=qnaBean.getQ_img2() %>" download="<%=qnaBean.getQ_img2() %>"><input class="link" type="text" value="<%=qnaBean.getQ_img2() %>" readonly></a><br><%
				}else{
					%><input type="text" value="" readonly><br><%
				}
			%>
			<label>첨부파일3</label>
			<%
				if(qnaBean.getQ_img3() != null){
					%><a href="./boardUpload/<%=qnaBean.getQ_img3() %>" download="<%=qnaBean.getQ_img3() %>"><input class="link" type="text" value="<%=qnaBean.getQ_img3() %>" readonly></a><br><%
				}else{
					%><input type="text" value="" readonly><br><%
				}
			%>
			<div id="buttons">
			<%
				if(qnaBean.getQ_answered() == 0){
					%><input type="button" class="btn" value="답변작성" onclick="location.href='WriteAnswer.ad?q_id=<%=qnaBean.getQ_id() %>'"><%
				}
			%>
				<input type="button" class="btn" value="목록" onclick="location.href='QnaList.ad'">
				<%if(qnaBean.getM_id().equals("admin")){
					%><input type="button" class="btn" value="삭제" onclick="deleteAnswer()"><%
				}
				%>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>