<%@page import="vo.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage_qnaInsert.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>
<%
String m_id = (String) session.getAttribute("m_id");
%>


<body>

	<!-- 헤더 들어가는곳 -->
	<header>
		<jsp:include page="../inc/header.jsp"></jsp:include>
	</header>
	<!-- 헤더 들어가는곳 -->
	<hr>

	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>

	<div class="qna_insert_all">
		<div id="qna_insert_i">
			<h1 id="qna_insert_title">
				1:1문의 작성
				<spen id="qna_insert_title_spen">꾸까 고객센터 1661-1031</spen>
			</h1>

			<form action="QnaInsertPro.qna" method="post" name="qnaForm"
				enctype="multipart/form-data">
				<label id="qna_insert_th"> <input id="qna_insert_inp"
					type="hidden" name="m_id" value=<%=m_id%>></label>
						 
				<label id="qna_insert_th"> 주문 상품 선택 <input
					id="qna_insert_order_td" type="text" name="o_id" id="oid" readonly>
					<input id="qna_insert_order_btn" type="button" value="주문 조회"
					onclick="window.open('QnaOrderList.qna','qnaOrderList','width=450,height=500')"></label><br>
							
				<label id="qna_insert_th">제목 <input
					id="qna_insert_subject_td" type="text" name="q_subject"
					placeholder="제목을 입력해주세요."></label><br> <label
					id="qna_insert_th"> 내용<br> <textarea
						id="qna_insert_contents_td" cols="70" rows="15" name="q_content"
						placeholder="내용을 작성해주세요:)"></textarea></label> <br>
				<p id="qna_insert_p">- 게시판 성격에 맞지 않는 글의 경우, 게시가 중단될 수 있습니다.</p>
				<br>
				<h3>사진 첨부</h3>
				<div id="qna_insert_ul">
					<input id="qna_insert_li" type="text" name="q_text"> <label
						class="input-file-button" for="qna_insert_li_inp"> 사진첨부</label> <input
						id="qna_insert_li_inp" type="file" name="q_img" value="사진 첨부">

					<input id="qna_insert_li" type="text" name="q_text2"> <label
						class="input-file-button" for="qna_insert_li_inp"> 사진첨부</label> <input
						id="qna_insert_li_inp" type="file" name="q_img2" value="사진 첨부">

					<input id="qna_insert_li" type="text" name="q_text3"> <label
						class="input-file-button" for="qna_insert_li_inp"> 사진첨부</label> <input
						id="qna_insert_li_inp" type="file" name="q_img3" value="사진 첨부">
				</div>
				<br>
				<p id="qna_insert_p2">- ( 5mb, 3장 첨부가능 )</p>
				<br> <input id="qna_insert_submit" type="submit" value="등록하기">
			</form>
		</div>
	</div>




	<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>


	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->


</body>
</html>