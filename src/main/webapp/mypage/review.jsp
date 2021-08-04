<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
	String m_id = (String) session.getAttribute("m_id");
	int od_id = Integer.parseInt(request.getParameter("od_id"));

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

	// 아이디 설정
	String mId[] = m_id.split("@");
	String a = mId[0].substring(0, 4);
	String editId = a + "***";
	%>
	<!-- 헤더 들어가는곳 -->

	<!-- 헤더 들어가는곳 -->


	<!-- 본문 내용 -->
	<div class="mypage_container">
		<div id="mypage_review_div">
			<form action="ReviewInsertPro.rv" method="post" name="fr" enctype="multipart/form-data">
				<input type="hidden" name="od_id" value="<%=od_id%>"> 
				<label>작성자 : <input type="text" name="r_writer" value="<%=m_id%>" readonly></label> 
				<label>	제목 : <input type="text" name="r_title"></label> <br>
				<label>내용 : <textarea rows="10" cols="20" name="r_content"></textarea></label> <br> 
				평점 : <select name="r_rate">
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
				</select><br> 
				<label>이미지:<input type="file" name="r_img"></label><br> 
				<input type="submit" value="작성하기">
			</form>

		</div>
	</div>


	<!-- 푸터 들어가는곳 -->

	<!-- 푸터 들어가는곳 -->
</body>
</html>