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
<style type="text/css">
table {
	border-collapse: collapse;
}
</style>
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
if (qnaList.isEmpty()) {
%>
<br>
<br>문의 내역이 존재하지 않습니다.
<%
} else {
%>
<table border="1">
	<tr>
		<td width="100px">작성일</td>
		<td width="200px">제목</td>
		<td width="100px">상태</td>
	</tr>
	
	<%
	for (int i = 0; i < qnaList.size(); i++) {
		if(qnaList.get(i).getQ_re_lev()==0)	{%>
			<tr>
				<td><%=qnaList.get(i).getQ_rdate() %></td>
				<td><%=qnaList.get(i).getQ_subject() %></td>
				<td>
					<%if(i < qnaList.size()-1) {
						// 밑의 판별식으로는 마지막 문의글의 답글이 없는 경우 오류 발생(비교식이 접근 가능한 list의 범위를 넘기 때문)
						// 따라서 마지막 문의글의 답변이 없는 경우, 이를 별도로 구분하여 답변 게시 유무를 출력.
						if(qnaList.get(i).getQ_re_ref() == qnaList.get(i+1).getQ_re_ref()) {%>
							답변 완료
						<%} else {%>
							답변 대기중
						<%} 
					  } else if(i == qnaList.size()-1) {%>
							답변 대기중
					<%}%>
				</td>
			</tr>
			<tr class="tr">
				<td>문의내용</td>
				<td colspan="2"><%=qnaList.get(i).getQ_content() %></td>
			</tr>
		<%} else if(qnaList.get(i).getQ_re_lev()==1) {%>
			<tr>
				<td>답변</td>
				<td colspan="2">
				<%=qnaList.get(i).getQ_subject() %> <small><%=qnaList.get(i).getQ_rdate() %></small><br>
				<%=qnaList.get(i).getQ_content() %>				
				</td>
			</tr>
			<%}
		}
	}
%>
</table>

</body>
</html>