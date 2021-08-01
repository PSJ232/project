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
<script src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('.subject').click(function() {
			$('.td').toggle('fast');
		});
	});
</script>
</head>
<body>

<%
ArrayList<QnaBean> qnaList = (ArrayList<QnaBean>) request.getAttribute("qnaList");
String m_id = (String) session.getAttribute("m_id");

%>

<h1>1:1 문의내역</h1>
&nbsp;
<a href="QnaInsert.qna">1:1 문의하기</a>
<hr>
[1:1 문의 게시판]은 월~금 10:00~18:00 운영됩니다.
<br> 급한 문의는 1661-1031 (월~금 10:00~18:00)로 문의 주세요.
<br> 운영 시간 내에는 2시간 이내에 답변을 드리나, 문의가 많을 때에는 다소 지연될 수 있습니다.
<%
if (qnaList == null) {
%>
<br>
<br>문의 내역이 존재하지 않습니다.
<%
} else {
%>
<table border="1">
	<tr>
<!-- 		<input type="hidden" value="QNA 번호"> -->
		<td>작성일</td>
		<td>제목</td>
		<td>상태</td>
	</tr>
	<%
	for (int i = 0; i < qnaList.size(); i++) {
		Date q_rdate = qnaList.get(i).getQ_rdate();
		String q_subject = qnaList.get(i).getQ_subject();
		String q_content = qnaList.get(i).getQ_content();
	%>
	<tr>
<%-- 		<input type="hidden" value="<%=qnaList.get(i).getQ_id()%>"> --%>
		<td><%=q_rdate%></td>
		<td><a href="#" class="subject"><%=q_subject%></a></td>
		<td>답변 대기중</td>
	</tr>
	<tr class="tr">
		<td>문의내용</td>
		<td colspan="3"><%=q_content%></td>
	</tr>
<%
	}
}
%>
</table>

</body>
</html>