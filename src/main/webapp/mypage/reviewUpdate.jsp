<%@page import="vo.MemberBean"%>
<%@page import="vo.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/mypage_reviwe.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<body>
<%
MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
String m_id = (String) session.getAttribute("m_id");
ReviewBean rb = (ReviewBean) request.getAttribute("rb");

String realGrade = "";
switch (memberMypageDetail.getG_id()) {
case 3:
	realGrade = "BLACK";
	break;
case 2:
	realGrade = "RED";
	break;
case 1:
	realGrade = "GREEN";
	break;
case 0:
	realGrade = "WHITE";
	break;
}
%>


	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->

	<!-- 본문 메인 상단 -->
	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>

	<!-- 본문 왼쪽 메뉴 -->
	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>


		<!-- 본문 내용 -->

		<div>
			<form action="ReviewUpdatePro.rv" method="post" name="fr"
				enctype="multipart/form-data">
				<input type="hidden" name="od_id" value="<%=rb.getOd_id()%>">
				<input type="hidden" name="r_id" value="<%=rb.getR_id()%>">
				r_id :
				<%=rb.getR_id()%>
				<br> 작성자 : <input type="text" name="r_writer"
					value="<%=m_id%>" readonly> 제목 : <input type="text"
					name="r_title" value=<%=rb.getR_title()%>> <br> 내용 :
				<textarea rows="10" cols="20" name="r_content"><%=rb.getR_content()%></textarea>
				<br> 평점 :
				<%
				String s5 = "", s4 = "", s3 = "", s2 = "", s1 = "";
				switch (rb.getR_rate()) {
				case 5:
					s5 = "selected";
					break;
				case 4:
					s4 = "selected";
					break;
				case 3:
					s3 = "selected";
					break;
				case 2:
					s2 = "selected";
					break;
				case 1:
					s1 = "selected";
					break;
				}
				%>

				<select name="r_rate">
					<option value="5" <%=s5%>>5</option>
					<option value="4" <%=s4%>>4</option>
					<option value="3" <%=s3%>>3</option>
					<option value="2" <%=s2%>>2</option>
					<option value="1" <%=s1%>>1</option>
				</select><br> 이미지:<input type="file" name="r_img"><%=rb.getR_img()%><br>
				<input type="hidden" name="oldr_img" value="<%=rb.getR_img()%>">
				<input type="submit" value="작성하기">
			</form>


		</div>
	</div>


	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->
</body>
</html>