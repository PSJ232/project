<%@page import="vo.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String m_id = (String)session.getAttribute("m_id");
%>

<body>
<h1>1:1문의 작성</h1> 꾸까 고객센터 1661-1031
<hr>
<form action="QnaInsertPro.qna" method="post" name="qnaForm" enctype="multipart/form-data">
	<input type="hidden" name="m_id" value="<%=m_id%>">
	주문 상품 선택 <input type="text" name="o_id" id="oid" readonly> <input type="button" value="주문 조회" onclick="window.open('QnaOrderList.qna','qnaOrderList','width=450,height=500')"><br>
	제목 <input type="text" name="q_subject" placeholder="제목을 입력해주세요."><br>
	내용<br> 
	<textarea cols="70" rows="15" name="q_content" placeholder="내용을 작성해주세요:)"></textarea><br>
	- 게시판 성격에 맞지 않는 글의 경우, 게시가 중단될 수 있습니다.<br>
	사진 첨부 <input type="file" name="q_img" value="사진 첨부"> <input type="button" value="사진 첨부"><br>
	<input type="file" name="q_img2" value="사진 첨부"> <input type="button" value="사진 첨부"><br>
	<input type="file" name="q_img3" value="사진 첨부"> <input type="button" value="사진 첨부"><br>
	
	- ( 5mb, 3장 첨부가능 )<br>
	<input type="submit" value="등록하기">
</form>
</body>
</html>